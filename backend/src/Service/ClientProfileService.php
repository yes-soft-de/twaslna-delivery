<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ClientProfileEntity;
use App\Entity\UserEntity;
use App\Manager\UserManager;
use App\Request\ClientProfileCreateRequest;
use App\Request\UserRegisterRequest;
use App\Request\ClientProfileUpdateRequest;
use App\Response\ClientProfileResponse;
use App\Response\UserRegisterResponse;
use App\Response\NotificationLocalResponse;
use App\Response\ClientFilterStoreResponse;
use App\Response\ClientFilterProductResponse;
use App\Service\RoomIdHelperService;
use App\Service\StoreOwnerProfileService;
use App\Service\ProductService;

use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;


class ClientProfileService
{
    private $autoMapping;
    private $userManager;
    private $roomIdHelperService;
    private $storeOwnerProfileService;
    private $productService;

    public function __construct(AutoMapping $autoMapping, UserManager $userManager,  RatingService $ratingService, ParameterBagInterface $params, RoomIdHelperService $roomIdHelperService, ProductService $productService, StoreOwnerProfileService $storeOwnerProfileService)
    {
        $this->autoMapping = $autoMapping;
        $this->userManager = $userManager;
        $this->ratingService = $ratingService;
        $this->roomIdHelperService = $roomIdHelperService;
        $this->productService = $productService;
        $this->storeOwnerProfileService = $storeOwnerProfileService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function clientRegister(UserRegisterRequest $request)
    {
        $roomID = $this->roomIdHelperService->roomIdGenerate();
        $userRegister = $this->userManager->clientRegister($request, $roomID);
        if ($userRegister instanceof UserEntity) {
            
        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $userRegister);

        }
        if ($userRegister == true) {
          
            $user = $this->userManager->getUserByUserID($request->getUserID());
            $user['found']="yes";
            return $user;
        }
    }

    public function createClientProfile(ClientProfileCreateRequest $request)
    {  
       $roomID = $this->roomIdHelperService->roomIdGenerate();
    
       $userProfile = $this->userManager->createclientProfile($request, $roomID);
      
        if ($userProfile instanceof ClientProfileEntity) {

            return $this->autoMapping->map(ClientProfileEntity::class,ClientProfileResponse::class, $userProfile);
       }
        if ($userProfile == true) {
            return $this->getClientProfileByClientID($request->getClientID());
       }
    }

    public function updateClientProfile(ClientProfileUpdateRequest $request)
    {
        $item = $this->userManager->updateClientProfile($request);
        
        return $this->autoMapping->map(ClientProfileEntity ::class, ClientProfileResponse::class, $item);
    }

    public function getClientProfileByClientID($clientID)
    {
        $item = $this->userManager->getClientProfileByClientID($clientID);  
            
        return $this->autoMapping->map('array', ClientProfileResponse::class, $item);
    }

    public function getClientProfileByID($id)
    {
        $item = $this->userManager->getClientProfileByID($id);
        return $this->autoMapping->map('array', ClientProfileResponse::class, $item);
    }

    public function getClientsProfile()
    {
        $response = [];
        $items = $this->userManager->getClientsProfile();
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ClientProfileResponse::class, $item);
            }        
        return $response;
    }

    public function countClients() {
        return $this->userManager->countClients();
    }

    public function clientFilter($itemName)
    {
        $response = [];

        $stores = $this->storeOwnerProfileService->getStoresByName($itemName);
        $products = $this->productService->getProductsByName($itemName);

        foreach ($stores as $store)
            {
                $store['rate'] = $this->ratingService->getAvgRating($stores[0]['id'], 'store');
                $response['stores'][]= $this->autoMapping->map('array', ClientFilterStoreResponse::class, $store);
            }
        foreach ($products as $product)
            {
                $response['products'][] = $this->autoMapping->map('array', ClientFilterProductResponse::class, $product);
            }
        return $response;
    }
}
