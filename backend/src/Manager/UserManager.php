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
use App\Request\StoreOwnerProfileCreateByAdminRequest;
use App\Request\StoreOwnerUpdateByAdminRequest;
use App\Request\CaptainProfileCreateRequest;
use App\Request\CaptainProfileUpdateLocationRequest;
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

            // Second, create the storeOwner's profile
            $storeOwnerProfile = $this->getStoreOwnerProfileByID($request->getUserID());
            
            if ($storeOwnerProfile == null) {
                $storeOwnerProfile = $this->autoMapping->map(UserRegisterRequest::class, StoreOwnerProfileEntity::class, $request);

                $storeOwnerProfile->setStoreOwnerID($userRegister->getId());
                $storeOwnerProfile->setStoreOwnerName($request->getUserName());
                
                $storeOwnerProfile->setStatus('inactive');
                $storeOwnerProfile->setFree(false);
                $storeOwnerProfile->setIs_best(false);

                $this->entityManager->persist($storeOwnerProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }
            return $userRegister;
        }
        else
        {
            $storeOwnerProfile = $this->getClientProfileByClientID($user['id']);

            if ($storeOwnerProfile == null)
            {
                $storeOwnerProfile = $this->autoMapping->map(UserRegisterRequest::class, StoreOwnerProfileEntity::class, $request);
                $storeOwnerProfile->setStoreOwnerID($user['id']);
                $storeOwnerProfile->setStoreOwnerName($request->getUserName());
                
                $this->entityManager->persist($storeOwnerProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

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

            // Second, create the client's profile
            $clientProfile = $this->getClientProfileByClientID($request->getUserID());
            
            if ($clientProfile == null) {
                $clientProfile = $this->autoMapping->map(UserRegisterRequest::class, ClientProfileEntity::class, $request);

                $clientProfile->setClientID($userRegister->getId());
                $clientProfile->setClientName($request->getUserName());
                
                $this->entityManager->persist($clientProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }
            return $userRegister;
        }
        else
        {
            $clientProfile = $this->getClientProfileByClientID($user['id']);

            if ($clientProfile == null)
            {
                $clientProfile = $this->autoMapping->map(UserRegisterRequest::class, ClientProfileEntity::class, $request);
                $clientProfile->setClientID($user['id']);
                $clientProfile->setClientName($request->getUserName());
                
                $this->entityManager->persist($clientProfile);
                $this->entityManager->flush();
                $this->entityManager->clear();
            }

            return true;
        }
    }

    public function captainRegister(UserRegisterRequest $request, $roomID)
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

        // Second, create the captain's profile
        $captainProfile = $this->getCaptainProfileByCaptainID($request->getUserID());
            
        if ($captainProfile == null) {
            $captainProfile = $this->autoMapping->map(UserRegisterRequest::class, CaptainProfileEntity::class, $request);
              //change setStatus to inactive
            $captainProfile->setStatus('active');
            $captainProfile->setRoomID($roomID);
            $captainProfile->setCaptainID($userRegister->getId());
            $captainProfile->setCaptainName($request->getUserName());
            $captainProfile->setSalary(0);
            $captainProfile->setBounce(0);
            
            $this->entityManager->persist($captainProfile);
            $this->entityManager->flush();
            $this->entityManager->clear();
        }
        return $userRegister;
    }
    else
    {
        $captainProfile = $this->getCaptainProfileByCaptainID($user['id']);

        if ($captainProfile == null)
        {
            $captainProfile = $this->autoMapping->map(UserRegisterRequest::class, CaptainProfileEntity::class, $request);
             //change setStatus to inactive
             $captainProfile->setStatus('active');
             $captainProfile->setRoomID($roomID);
            $captainProfile->setCaptainID($user['id']);
            $captainProfile->setCaptainName($request->getUserName());
            $captainProfile->setSalary(0);
            $captainProfile->setBounce(0);
            
            $this->entityManager->persist($captainProfile);
            $this->entityManager->flush();
            $this->entityManager->clear();
        }
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
            $userProfile->setIs_best(false);

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
            if($request->getCaptainName() == null) {
                $request->setCaptainName($item->getCaptainName());
            }
            $item = $this->autoMapping->mapToObject(CaptainProfileUpdateRequest::class, CaptainProfileEntity::class, $request, $item);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function captainProfileUpdateLocation(CaptainProfileUpdateLocationRequest $request)
    {
        $item = $this->captainProfileEntityRepository->getByCaptainIDForUpdate($request->getUserID());
        if ($item) {
            $item = $this->autoMapping->mapToObject(CaptainProfileUpdateLocationRequest::class, CaptainProfileEntity::class, $request, $item);
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
    public function createClientProfile(ClientProfileCreateRequest $request, $roomID)
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
        $item = $this->clientProfileEntityRepository->findOneBy(['clientID'=>$request->getClientID()]);
       
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
    
    public function getStoreOwnerBest()
    {
        return $this->storeOwnerProfileEntityRepository->getStoreOwnerBest();
    }

    public function createStoreOwnerProfileByAdmin(StoreOwnerProfileCreateByAdminRequest $request)
    {
            $userProfile = $this->autoMapping->map(StoreOwnerProfileCreateByAdminRequest::class, StoreOwnerProfileEntity::class, $request);

            $userProfile->setStatus('active');
            $userProfile->setStoreOwnerID($request->getUserID());
            $userProfile->setFree(false);
            $userProfile->setIs_best(false);

            $this->entityManager->persist($userProfile);
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $userProfile;
    }
}
