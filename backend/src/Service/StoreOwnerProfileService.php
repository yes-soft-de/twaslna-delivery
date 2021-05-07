<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Manager\UserManager;
use App\Request\StoreOwnerProfileCreateRequest;
use App\Request\StoreOwnerProfileUpdateRequest;
use App\Request\StoreOwnerUpdateByAdminRequest;
use App\Request\UserRegisterRequest;
use App\Response\StoreOwnerProfileCreateResponse;
use App\Response\StoreOwnerProfileResponse;
use App\Response\UserRegisterResponse;
use App\Service\RoomIdHelperService;
use App\Service\StoreOwnerBranchService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;


class StoreOwnerProfileService
{
    private $autoMapping;
    private $userManager;
    private $storeOwnerBranchService;
    private $params;
    private $roomIdHelperService;

    public function __construct(AutoMapping $autoMapping, UserManager $userManager,  RatingService $ratingService, StoreOwnerBranchService $storeOwnerBranchService, ParameterBagInterface $params, RoomIdHelperService $roomIdHelperService)
    {
        $this->autoMapping = $autoMapping;
        $this->userManager = $userManager;
        $this->ratingService = $ratingService;
        $this->storeOwnerBranchService = $storeOwnerBranchService;
        $this->roomIdHelperService = $roomIdHelperService;

        $this->params = $params->get('upload_base_url') . '/';
    }

    public function userRegister(UserRegisterRequest $request)
    {
        $userRegister = $this->userManager->userRegister($request);
        if ($userRegister instanceof UserEntity) {
            
        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $userRegister);

        }
        if ($userRegister == true) {
          
            $user = $this->userManager->getUserByUserID($request->getUserID());
            $user['found']="yes";
            return $user;
        }
    }

    public function createStoreOwnerProfile(StoreOwnerProfileCreateRequest $request)
    {
        $uuid = $this->roomIdHelperService->roomIdGenerate();
        $userProfile = $this->userManager->createStoreOwnerProfile($request, $uuid);

        if ($userProfile instanceof StoreOwnerProfileEntity) {

            return $this->autoMapping->map(StoreOwnerProfileEntity::class,StoreOwnerProfileCreateResponse::class, $userProfile);
       }
        if ($userProfile == true) {
          
           return $this->getStoreOwnerProfileByID($request->getUserID());
       }
    }

    public function updateStoreOwnerProfile(StoreOwnerProfileUpdateRequest $request)
    {
        $item = $this->userManager->updateStoreOwnerProfile($request);
        
        return $this->autoMapping->map(StoreOwnerProfileEntity::class, StoreOwnerProfileResponse::class, $item);
    }

    public function updateStoreOwnerByAdmin(StoreOwnerUpdateByAdminRequest $request)
    {
        $item = $this->userManager->updateStoreOwnerByAdmin($request);

        return $this->autoMapping->map(StoreOwnerProfileEntity::class, StoreOwnerProfileResponse::class, $item);
    }

    public function getStoreOwnerProfileById($id)
    {
        $item = $this->userManager->getStoreOwnerProfileByID($id);
      
        $item['branches'] = $this->storeOwnerBranchService->branchesByUserId($item['userID']);
        return $this->autoMapping->map('array', StoreOwnerProfileCreateResponse::class, $item);
    }

    public function getStoreOwnerProfileByUserID($userID)
    {
        $item = $this->userManager->getStoreOwnerProfileByUserID($userID);
        $item['branches'] = $this->storeOwnerBranchService->branchesByUserId($userID);

        try {
            if ($item['image'])
            {
                $item['imageURL'] = $item['image'];
                $item['image'] = $this->params.$item['image'];
            }
            $item['baseURL'] = $this->params;
        }
        catch(\Exception $e) {

        }
        
        return $this->autoMapping->map('array', StoreOwnerProfileCreateResponse::class, $item);
    }

//هذا غير مستخدم ولكن يجب أن تتأكد
    // public function getCaptainsState($state)
    // {
    //     $response = [];
    //     $items = $this->userManager->getCaptainsState($state);

    //     foreach( $items as  $item ) {
           
    //         $item['totalBounce'] = $this->totalBounceCaptain($item['id'], 'admin');
    //         $item['imageURL'] = $item['image'];
    //         $item['image'] = $this->params.$item['image'];
    //         $item['drivingLicenceURL'] = $item['drivingLicence'];
    //         $item['drivingLicence'] = $this->params.$item['drivingLicence'];
    //         $item['baseURL'] = $this->params;

    //         $item['countOrdersDeliverd'] = $this->acceptedOrderService->countAcceptedOrder($item['captainID']);
           
    //         $item['rating'] = $this->ratingService->getRatingByCaptainID($item['captainID']);
            
    //         $response[]  = $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $item);
    //         }
    //     return $response;
    // }

    public function getAllStoreOwners()
    {
        $response = [];
        $owners = $this->userManager->getAllStoreOwners();
        foreach ($owners as $owner) {
            $response[] = $this->autoMapping->map('array', StoreOwnerProfileCreateResponse::class, $owner);
            }        
        return $response;
    }
}
