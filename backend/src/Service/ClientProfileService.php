<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\ClientProfileEntity;
use App\Manager\UserManager;
use App\Request\ClientProfileCreateRequest;
use App\Request\UserProfileUpdateRequest;
use App\Response\UserProfileResponse;
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

    public function createUserProfile(ClientProfileCreateRequest $request)
    {  
       $uuid = $this->roomIdHelperService->roomIdGenerate();
    
       $userProfile = $this->userManager->createUserProfile($request, $uuid);
      
        if ($userProfile instanceof ClientProfileEntity) {

            return $this->autoMapping->map(ClientProfileEntity::class,UserProfileResponse::class, $userProfile);
       }
        if ($userProfile == true) {
            return $this->getUserProfileByUserID($request->getUserID());
       }
    }

    public function updateUserProfile(UserProfileUpdateRequest $request)
    {
        $item = $this->userManager->updateUserProfile($request);
        
        return $this->autoMapping->map(ClientProfileEntity ::class, UserProfileResponse::class, $item);
    }

    public function getUserProfileByUserID($userID)
    {
        $item = $this->userManager->getUserProfileByUserID($userID);  
            
        return $this->autoMapping->map('array', UserProfileResponse::class, $item);
    }

    public function getUserProfileByID($id)
    {
        $item = $this->userManager->getUserProfileByID($id);
        return $this->autoMapping->map('array', UserProfileResponse::class, $item);
    }

    public function getUsersProfile()
    {
        $response = [];
        $items = $this->userManager->getUsersProfile();
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', UserProfileResponse::class, $item);
            }        
        return $response;
    }
}
