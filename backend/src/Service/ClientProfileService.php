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
use App\Service\RoomIdHelperService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;


class ClientProfileService
{
    private $autoMapping;
    private $userManager;
    private $params;
    private $roomIdHelperService;

    public function __construct(AutoMapping $autoMapping, UserManager $userManager,  RatingService $ratingService, ParameterBagInterface $params, RoomIdHelperService $roomIdHelperService)
    {
        $this->autoMapping = $autoMapping;
        $this->userManager = $userManager;
        $this->ratingService = $ratingService;
        $this->roomIdHelperService = $roomIdHelperService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function clientRegister(UserRegisterRequest $request)
    {
        $userRegister = $this->userManager->clientRegister($request);
        if ($userRegister instanceof UserEntity) {
            
        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $userRegister);

        }
        if ($userRegister == true) {
          
            $user = $this->userManager->getUserByUserID($request->getUserID());
            $user['found']="yes";
            return $user;
        }
    }

    public function createclientProfile(ClientProfileCreateRequest $request)
    {  
       $uuid = $this->roomIdHelperService->roomIdGenerate();
    
       $userProfile = $this->userManager->createclientProfile($request, $uuid);
      
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
}
