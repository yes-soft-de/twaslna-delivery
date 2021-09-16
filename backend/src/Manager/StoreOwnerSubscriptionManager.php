<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\StoreOwnerSubscriptionEntity;
use App\Repository\StoreOwnerSubscriptionEntityRepository;
use App\Request\StoreOwnerSubscriptionCreateRequest;
use App\Request\StoreOwnerSubscriptionNextRequest;
use App\Request\StoreOwnerSubscriptionChangeIsFutureRequest;
use App\Request\StoreOwnerSubscriptionUpdateStateRequest;
use App\Request\StoreOwnerUpdateSubscribeStatusRequest;
use Doctrine\ORM\EntityManagerInterface;
use DateTime;

//TODO this for remove
class StoreOwnerSubscriptionManager
{
    private $autoMapping;
    private $entityManager;
    private $storeOwnersubscribeRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, StoreOwnerSubscriptionEntityRepository $storeOwnersubscribeRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->storeOwnersubscribeRepository = $storeOwnersubscribeRepository;
    }

    public function createStoreOwnerSubscription(StoreOwnerSubscriptionCreateRequest $request)
    { 
        // NOTE: change active to inactive 
        $request->setStatus('active');
        $request->setIsFuture(0);
        $subscriptionEntity = $this->autoMapping->map(StoreOwnerSubscriptionCreateRequest::class, StoreOwnerSubscriptionEntity::class, $request);

        $this->entityManager->persist($subscriptionEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $subscriptionEntity;
    }

    public function storeOwnerSubscriptionRenew(StoreOwnerSubscriptionNextRequest $request, $status)
    { 
        // NOTE: change active to inactive 
        $request->setStatus('active');
       
        if($status == "active") {
             $request->setIsFuture(1);
             }
        else{
            $request->setIsFuture(0);
        }
        $subscriptionEntity = $this->autoMapping->map(SubscriptionNextRequest::class, StoreOwnerSubscriptionEntity::class, $request);
    // tell talal and mohammed befor active    
    // to save subscribe end date automatic
       // $subscriptionEntity->setEndDate(date_modify(new DateTime('now'),'+1 month'));

        $this->entityManager->persist($subscriptionEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $subscriptionEntity;
    }

    public function getStoreOwnerSubscriptionforowner($userId)
    {
        return $this->storeOwnersubscribeRepository->getStoreOwnerSubscriptionforowner($userId);
    }

    public function storeOwnerSubscriptionUpdateState(StoreOwnerSubscriptionUpdateStateRequest $request)
    {
        $subscribeEntity = $this->storeOwnersubscribeRepository->find($request->getId());
        
        $subscribeEntity->setEndDate(date_modify(new DateTime('now'),'+1 month'));

        if (!$subscribeEntity) {
            return null;
        }

        $subscribeEntity = $this->autoMapping->mapToObject(StoreOwnerSubscriptionUpdateStateRequest::class, StoreOwnerSubscriptionEntity::class, $request, $subscribeEntity);

        $this->entityManager->flush();

        return $subscribeEntity;
    }

    public function updateSubscribeStatus($id, $status)
    {
        $subscribeEntity = $this->storeOwnersubscribeRepository->find($id);
        
        $subscribeEntity->setStatus($status);

        if (!$subscribeEntity) {
            return null;
        }

        $subscribeEntity = $this->autoMapping->map(StoreOwnerUpdateSubscribeStatusRequest::class, StoreOwnerSubscriptionEntity::class, $subscribeEntity);

        $this->entityManager->flush();

        return $subscribeEntity;
    }

    public function changeIsFutureToFalse($id)
    {
        $subscribeEntity = $this->storeOwnersubscribeRepository->find($id);
    //Make this subscription the current subscription
        $subscribeEntity->setIsFuture(0);
    //The end date of the previous subscription is the start date of the current subscription
        $subscribeEntity->setStartDate(new DateTime('now'));

        $subscribeEntity->setEndDate(date_modify(new DateTime('now'),'+1 month'));

        if (!$subscribeEntity) {
            return null;
        }

        $subscribeEntity = $this->autoMapping->map(StoreOwnerSubscriptionChangeIsFutureRequest::class, SubscriptionEntity::class, $subscribeEntity);

        $this->entityManager->flush();

        return $subscribeEntity;
    }

    public function getStoreOwnerSubscriptionPending()
    {
        return $this->storeOwnersubscribeRepository->getStoreOwnerSubscriptionPending();
    }

    public function getStoreOwnerSubscriptionById($id)
    {
        return $this->storeOwnersubscribeRepository->getStoreOwnerSubscriptionById($id);
    }

    public function subscriptionIsActive($ownerID, $subscribeId)
    {
        return $this->storeOwnersubscribeRepository->subscriptionIsActive($ownerID, $subscribeId);
    }

    public function countpendingContracts()
    {
        return $this->storeOwnersubscribeRepository->countpendingContracts();
    }

    public function countDoneContracts()
    {
        return $this->storeOwnersubscribeRepository->countDoneContracts();
    }

    public function countCancelledContracts()
    {
        return $this->storeOwnersubscribeRepository->countCancelledContracts();
    }

    public function getRemainingOrders($ownerID, $id)
    {
        return $this->storeOwnersubscribeRepository->getRemainingOrders($ownerID, $id);
    }

    public function getCountCancelledOrders($subscribeId)
    {
        return $this->storeOwnersubscribeRepository->getCountCancelledOrders($subscribeId);
    }

    public function getCountConsumedOrders($subscribeId)
    {
        return $this->storeOwnersubscribeRepository->getCountConsumedOrders($subscribeId);
    }

    public function subscripeNewUsers($fromDate, $toDate)
    {
        return $this->storeOwnersubscribeRepository->subscripeNewUsers($fromDate, $toDate);
    }

    public function getSubscriptionCurrent($ownerID)
    {
        return $this->storeOwnersubscribeRepository->getSubscriptionCurrent($ownerID);
    }

    public function getNextSubscription($ownerID)
    {
        return $this->storeOwnersubscribeRepository->getNextSubscription($ownerID);
    }

    public function totalAmountOfSubscriptions($ownerID)
    {
        return $this->storeOwnersubscribeRepository->totalAmountOfSubscriptions($ownerID);
    }
}
