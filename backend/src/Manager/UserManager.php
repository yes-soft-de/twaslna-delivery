<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\UserEntity;
use App\Entity\ClientProfileEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Entity\CaptainProfileEntity;
use App\Repository\UserEntityRepository;
use App\Repository\StoreOwnerProfileEntityRepository;
use App\Repository\CaptainProfileEntityRepository;
use App\Repository\ClientProfileEntityRepository;
use App\Request\StoreOwnerProfileCreateRequest;
use App\Request\StoreOwnerUpdateByAdminRequest;
use App\Request\CaptainProfileCreateRequest;
use App\Request\CaptainVacationCreateRequest;
use App\Request\StoreOwnerProfileUpdateRequest;
use App\Request\CaptainProfileUpdateByAdminRequest;
use App\Request\CaptainProfileUpdateRequest;
use App\Request\ClientProfileCreateRequest;
use App\Request\ClientProfileUpdateRequest;
use App\Request\UserRegisterRequest;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserManager
{
    private $autoMapping;
    private $entityManager;
    private $encoder;
    private $userRepository;
    private $captainProfileEntityRepository;
    private $storeOwnerProfileEntityRepository;
    private $clientProfileEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, UserPasswordEncoderInterface $encoder, UserEntityRepository $userRepository, CaptainProfileEntityRepository $captainProfileEntityRepository, StoreOwnerProfileEntityRepository $storeOwnerProfileEntityRepository, ClientProfileEntityRepository $clientProfileEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->encoder = $encoder;
        $this->userRepository = $userRepository;
        $this->captainProfileEntityRepository = $captainProfileEntityRepository;
        $this->storeOwnerProfileEntityRepository = $storeOwnerProfileEntityRepository;
        $this->clientProfileEntityRepository = $clientProfileEntityRepository;
    }

    public function storeOwnerRegister(UserRegisterRequest $request)
    {
        $user = $this->getUserByUserID($request->getUserID());
        if ($user == null) {

        $userRegister = $this->autoMapping->map(UserRegisterRequest::class, UserEntity::class, $request);

        $user = new UserEntity($request->getUserID());

        if ($request->getPassword()) {
            $userRegister->setPassword($this->encoder->encodePassword($user, $request->getPassword()));
        }

        $userRegister->setRoles(["ROLE_OWNER"]);

        $this->entityManager->persist($userRegister);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $userRegister;
    }
    else {
        return true;
    }
    }

    public function clientRegister(UserRegisterRequest $request)
    {
        $user = $this->getUserByUserID($request->getUserID());
        if ($user == null) {

        $userRegister = $this->autoMapping->map(UserRegisterRequest::class, UserEntity::class, $request);

        $user = new UserEntity($request->getUserID());

        if ($request->getPassword()) {
            $userRegister->setPassword($this->encoder->encodePassword($user, $request->getPassword()));
        }

        $userRegister->setRoles(["ROLE_CLIENT"]);

        $this->entityManager->persist($userRegister);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $userRegister;
    }
    else {
        return true;
    }
    }

    public function captainRegister(UserRegisterRequest $request)
    {
        $user = $this->getUserByUserID($request->getUserID());
        if ($user == null) {

        $userRegister = $this->autoMapping->map(UserRegisterRequest::class, UserEntity::class, $request);

        $user = new UserEntity($request->getUserID());

        if ($request->getPassword()) {
            $userRegister->setPassword($this->encoder->encodePassword($user, $request->getPassword()));
        }

        $userRegister->setRoles(["ROLE_CAPTAIN"]);

        $this->entityManager->persist($userRegister);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $userRegister;
    }
    else {
        return true;
    }
    }

    public function getUserByUserID($userID)
    {
        return $this->userRepository->getUserByUserID($userID);
    }

    public function createStoreOwnerProfile(StoreOwnerProfileCreateRequest $request, $roomID)
    {
        $request->setRoomID($roomID);
        $userProfile = $this->getStoreOwnerProfileByID($request->getStoreOwnerID());
        if ($userProfile == null) {
            $userProfile = $this->autoMapping->map(StoreOwnerProfileCreateRequest::class, StoreOwnerProfileEntity::class, $request);

            $userProfile->setStatus('inactive');
            $userProfile->setFree(false);

            $this->entityManager->persist($userProfile);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $userProfile;
        }
        else {
            return true;
        }
    }

    public function updateStoreOwnerProfile(StoreOwnerProfileUpdateRequest $request)
    {
        $item = $this->storeOwnerProfileEntityRepository->getUserProfile($request->getStoreOwnerID());

        if ($item) {
            $item = $this->autoMapping->mapToObject(StoreOwnerProfileUpdateRequest::class, StoreOwnerProfileEntity::class, $request, $item);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function updateStoreOwnerByAdmin(StoreOwnerUpdateByAdminRequest $request)
    {
        $item = $this->storeOwnerProfileEntityRepository->find($request->getId());

        if ($item) {
            $item = $this->autoMapping->mapToObject(StoreOwnerUpdateByAdminRequest::class, StoreOwnerProfileEntity::class, $request, $item);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function getStoreOwnerProfileByID($id)
    {
        return $this->storeOwnerProfileEntityRepository->getStoreOwnerProfileByID($id);
    }

    public function getStoreOwnerProfileByStoreOwnerID($storeOwnerID)
    {
        return $this->storeOwnerProfileEntityRepository->getStoreOwnerProfileByStoreOwnerID($storeOwnerID);
    }

    public function getremainingOrders($userID)
    {
        return $this->storeOwnerProfileEntityRepository->getremainingOrders($userID);
    }

    public function createCaptainProfile(CaptainProfileCreateRequest $request, $roomID)
    {
        $request->setRoomID($roomID);
        $isCaptainProfile = $this->captainProfileEntityRepository->getcaptainprofileByCaptainID($request->getCaptainID());

        if ($isCaptainProfile == null) {

            $captainProfile = $this->autoMapping->map(CaptainProfileCreateRequest::class, CaptainProfileEntity::class, $request);
            
            //change setStatus to inactive
            $captainProfile->setStatus('active');

            $captainProfile->setIsOnline('active');
            
            $this->entityManager->persist($captainProfile);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $captainProfile;
        }
        else {
            return true;
        }
    }

    public function updateCaptainProfile(CaptainProfileUpdateRequest $request)
    {
        $item = $this->captainProfileEntityRepository->getByCaptainIDForUpdate($request->getUserID());
        if ($item) {
            $item = $this->autoMapping->mapToObject(CaptainProfileUpdateRequest::class, CaptainProfileEntity::class, $request, $item);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function updateCaptainProfileByAdmin(CaptainProfileUpdateByAdminRequest $request)
    {
        $item = $this->captainProfileEntityRepository->getByCaptainIDForUpdate($request->getCaptainID());
        if ($item) {
            $item = $this->autoMapping->mapToObject(CaptainProfileUpdateByAdminRequest::class, CaptainProfileEntity::class, $request, $item);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function updateCaptainStateByAdmin(CaptainVacationCreateRequest $request)
    {  
        $item = $this->captainProfileEntityRepository->getByCaptainIDForUpdate($request->getCaptainId());
        
        if ($item) {
            $item = $this->autoMapping->mapToObject(CaptainVacationCreateRequest::class, CaptainProfileEntity::class, $request, $item);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function getCaptainProfileByCaptainID($captainID)
    {
        return $this->captainProfileEntityRepository->getCaptainProfileByCaptainID($captainID);
    }
    
    public function getCaptainProfileByID($captainProfileId)
    {
        return $this->captainProfileEntityRepository->getCaptainProfileByID($captainProfileId);
    }

    public function getCaptainsInactive()
    {
            return $this->captainProfileEntityRepository->getCaptainsInactive();
    }

    public function captainIsActive($captainID)
    {
        return $this->captainProfileEntityRepository->captainIsActive($captainID);
    }

    public function getCaptainsState($state)
    {
        return $this->captainProfileEntityRepository->getCaptainsState($state);
    }

    public function countpendingCaptains()
    {
        return $this->captainProfileEntityRepository->countpendingCaptains();
    }
   
    public function countOngoingCaptains()
    {
        return $this->captainProfileEntityRepository->countOngoingCaptains();
    }
   
    public function countDayOfCaptains()
    {
        return $this->captainProfileEntityRepository->countDayOfCaptains();
    }
   
    public function getCaptainsInVacation()
    {
        return $this->captainProfileEntityRepository->getCaptainsInVacation();
    }

    public function getCaptainAsArray($id)
    {
        return $this->captainProfileEntityRepository->getCaptainAsArray($id);
    }

    public function getCaptainAsArrayByCaptainId($captainID)
    {
        return $this->captainProfileEntityRepository->getCaptainAsArrayByCaptainId($captainID);
    }
//لا داعي له ولكن تركته لتأكد
    public function getOwners()
    {
        return $this->storeOwnerProfileEntityRepository->getOwners();
    }
//لا داعي له ولكن تركته لتأكد
    public function getCaptains($userID)
    {
        return $this->captainProfileEntityRepository->getCaptains($userID);
    }

    public function getAllStoreOwners()
    {
        return $this->storeOwnerProfileEntityRepository->getAllStoreOwners();
    }
    
    public function getAllCaptains()
    {
        return $this->captainProfileEntityRepository->getAllCaptains();
    }

    public function getcaptainByRoomID($roomID)
    {
        return $this->captainProfileEntityRepository->getcaptainByRoomID($roomID);
    }

    public function updateCaptainNewMessageStatus($request, $NewMessageStatus)
    {
        if ($request) {
           
            $entity = $this->captainProfileEntityRepository->find($request->getId());
        
            if (!$entity) {
                return null;
            }
            $entity->setNewMessageStatus($NewMessageStatus);
        
            $entity = $this->autoMapping->mapToObject(CaptainProfileEntity::class, CaptainProfileEntity::class, $entity, $entity);
          
            $this->entityManager->flush();

            return $entity;
        }
        return null;
    }

    public function getTop5Captains()
    {        
        return $this->captainProfileEntityRepository->getTop5Captains();
    }

    public function getTopCaptainsInLastMonthDate($fromDate, $toDate)
    {
        return $this->captainProfileEntityRepository->getTopCaptainsInLastMonthDate($fromDate, $toDate);
    }

//User section 
    public function createclientProfile(ClientProfileCreateRequest $request, $roomID)
    {
        $request->setRoomID($roomID);
        $userProfile = $this->getClientProfileByClientID($request->getClientID());
        if ($userProfile == null) {
            $userProfile = $this->autoMapping->map(ClientProfileCreateRequest::class, ClientProfileEntity::class, $request);

            $this->entityManager->persist($userProfile);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $userProfile;
        }
        else {
            return true;
        }
    }

    public function getClientProfileByClientID($clientID)
    {
        return $this->clientProfileEntityRepository->getClientProfileByClientID($clientID);
    }

    public function updateClientProfile(ClientProfileUpdateRequest $request)
    {
        $item = $this->clientProfileEntityRepository->findOneBy(['userID'=>$request->getClientID()]);

        if ($item) {
            $item = $this->autoMapping->mapToObject(ClientProfileUpdateRequest::class, ClientProfileEntity::class, $request, $item);

            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function getClientProfileByID($id)
    {
        return $this->clientProfileEntityRepository->getClientProfileByID($id);
    }

    public function getClientsProfile()
    {
        return $this->clientProfileEntityRepository->getClientsProfile();
    }
    
    public function getStoreOwnerByCategoryId($storeCategoryId)
    {
        return $this->storeOwnerProfileEntityRepository->getStoreOwnerByCategoryId($storeCategoryId);
    }
}
