<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\StoreOwnerSubscriptionEntity;
use App\Manager\StoreOwnerSubscriptionManager;
use App\Request\StoreOwnerSubscriptionCreateRequest;
use App\Request\StoreOwnerSubscriptionNextRequest;
use App\Response\StoreOwnerSubscriptionResponse;
use App\Response\StoreOwnerSubscriptionByIdResponse;
use App\Response\StoreOwnerMySubscriptionsResponse;
use App\Response\StoreOwnerSubscriptionBalanceResponse;
use App\Service\DateFactoryService;
use dateTime;


class StoreOwnerSubscriptionService
{
    private $autoMapping;
    private $storeOwnerSubscriptionManager;
    private $dateFactoryService;

    public function __construct(AutoMapping $autoMapping, StoreOwnerSubscriptionManager $storeOwnerSubscriptionManager, DateFactoryService $dateFactoryService)
    {
        $this->autoMapping = $autoMapping;
        $this->storeOwnerSubscriptionManager = $storeOwnerSubscriptionManager;
        $this->dateFactoryService = $dateFactoryService;
    }

    public function createStoreOwnerSubscription(StoreOwnerSubscriptionCreateRequest $request)
    {
        $subscriptionResult = $this->storeOwnerSubscriptionManager->createStoreOwnerSubscription($request);

        return $this->autoMapping->map(StoreOwnerSubscriptionEntity::class, StoreOwnerSubscriptionResponse::class, $subscriptionResult);
    }
    
    public function storeOwnerSubscriptionRenew(StoreOwnerSubscriptionNextRequest $request)
    {
       $SubscriptionCurrent = $this->getSubscriptionCurrent($request->getOwnerID());
       
       $status = $this->subscriptionIsActive($request->getOwnerID(), $SubscriptionCurrent['id']);
        $subscriptionResult = $this->storeOwnerSubscriptionManager->storeOwnerSubscriptionRenew($request, $status);
        
        return $this->autoMapping->map(StoreOwnerSubscriptionEntity::class, StoreOwnerSubscriptionResponse::class, $subscriptionResult);
    }

    public function getStoreOwnerSubscriptionforowner($ownerID)
    {
       $response = [];
       $currentSubscription = $this->getSubscriptionCurrent($ownerID);

       if ($currentSubscription) {
            $this->checkSubscription($ownerID, $currentSubscription['id']);
       }

       $subscriptions = $this->storeOwnerSubscriptionManager->getStoreOwnerSubscriptionforowner($ownerID);
      
        foreach ($subscriptions as $subscription) {
            $subscription['isCurrent'] = "no";
            if ($currentSubscription) {
            $this->subscriptionIsActive($ownerID, $currentSubscription['id']);
            if ($currentSubscription['id'] == $subscription['id']) {$current = "yes";}
            else {$current = "no";}
            $subscription['isCurrent'] = $current;
            }

            $response[] = $this->autoMapping->map("array", StoreOwnerMySubscriptionsResponse::class, $subscription);
        }
        return $response;
    }
  
    public function storeOwnerSubscriptionUpdateState($request)
    {
        $result = $this->storeOwnerSubscriptionManager->storeOwnerSubscriptionUpdateState($request);

        return $this->autoMapping->map(StoreOwnerSubscriptionEntity::class, StoreOwnerSubscriptionResponse::class, $result);
    }
    
    public function updateSubscribeStatus($id, $status)
    {
        $result = $this->storeOwnerSubscriptionManager->updateSubscribeStatus($id, $status);

        return $this->autoMapping->map(StoreOwnerSubscriptionEntity::class, StoreOwnerSubscriptionResponse::class, $result);
    }

    public function changeIsFutureToFalse($id)
    {
        $result = $this->storeOwnerSubscriptionManager->changeIsFutureToFalse($id);

        return $this->autoMapping->map(StoreOwnerSubscriptionEntity::class, StoreOwnerSubscriptionResponse::class, $result);
    }

    public function getStoreOwnerSubscriptionPending()
    {
        $response = [];
        $items = $this->storeOwnerSubscriptionManager->getStoreOwnerSubscriptionPending();
       
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', StoreOwnerSubscriptionByIdResponse::class, $item);
        }
        return $response;
    }
    
    public function getStoreOwnerSubscriptionById($id)
    {
        $response = [];
        $items = $this->storeOwnerSubscriptionManager->getStoreOwnerSubscriptionById($id);
      
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', StoreOwnerSubscriptionByIdResponse::class, $item);
        }
        return $response;
    }

    public function subscriptionIsActive($ownerID, $subscribeId)
    {
        $this->checkSubscription($ownerID, $subscribeId);
    
        $item = $this->storeOwnerSubscriptionManager->subscriptionIsActive($ownerID, $subscribeId);
        if ($item) {
          return  $item['status'];
        }

        return $item ;
     }

    // check subscription , if time is finishe or order count is finishe, change status value to 'finished'
    //return full information for the current subscription
    public function checkSubscription($ownerID, $subscribeId):object
    {
        $response = [];
        //Get full information for the current subscription
        $remainingOrdersOfPackage = $this->storeOwnerSubscriptionManager->getRemainingOrders($ownerID, $subscribeId);
        $countCancelledOrder = $this->storeOwnerSubscriptionManager->getCountCancelledOrders($ownerID, $subscribeId);
        $countConsumedOrders = $this->storeOwnerSubscriptionManager->getCountConsumedOrders($subscribeId);
        //Not counting cancelled orders
        $remainingOrdersOfPackage['remainingOrders'] = $remainingOrdersOfPackage['remainingOrders'] + $countCancelledOrder['countCancelledOrder'];
       
        $remainingOrdersOfPackage['countConsumedOrders'] = $countConsumedOrders['countConsumedOrders'];
        if ($remainingOrdersOfPackage['subscriptionEndDate']) {
   
            $endDate =date_timestamp_get($remainingOrdersOfPackage['subscriptionEndDate']);
            
            $now =date_timestamp_get(new DateTime("now"));

            if ( $endDate <= $now)  {

                $this->updateSubscribeStatus($remainingOrdersOfPackage['subscriptionID'], 'date finished');
                if($this->getNextSubscription($ownerID)) {
                    $this->changeIsFutureToFalse($this->getNextSubscription($ownerID));
                    }
                $response[] = ["subscripe finished, date is finished"];
            }

            if ($remainingOrdersOfPackage['remainingOrders'] == 0)  {
        
                $this->updateSubscribeStatus($remainingOrdersOfPackage['subscriptionID'], 'orders finished');
                if($this->getNextSubscription($ownerID)) {
                $this->changeIsFutureToFalse($this->getNextSubscription($ownerID));
                }
                $response[] = ["subscripe finished, count Orders is finished"];
            }
            
        }
        $response = $this->autoMapping->map('array', StoreOwnerSubscriptionBalanceResponse::class, $remainingOrdersOfPackage);
        $subscribeStauts = $this->storeOwnerSubscriptionManager->subscriptionIsActive($ownerID, $subscribeId);
        
        if ($subscribeStauts['status']) {
            $response->subscriptionstatus = $subscribeStauts['status'];
        }
        return $response;
     }

    public function subscripeNewUsers($year, $month)
    {
        $date = $this->dateFactoryService->returnRequiredDate($year, $month);
        return $this->storeOwnerSubscriptionManager->subscripeNewUsers($date[0], $date[1]);       
     }

    public function dashboardContracts($year, $month)
    {
        $response = [];

        $response[] = $this->storeOwnerSubscriptionManager->countpendingContracts();
        $response[] = $this->storeOwnerSubscriptionManager->countDoneContracts();
        $response[] = $this->subscripeNewUsers($year, $month);

        $subscriptionsPending = $this->storeOwnerSubscriptionManager->getStoreOwnerSubscriptionPending();
       
        foreach ($subscriptionsPending as $item) {
            $response[] = $this->autoMapping->map('array', StoreOwnerSubscriptionByIdResponse::class, $item);
        }
        
        return $response;
    }

    public function getSubscriptionCurrent($ownerID)
    {
        return $this->storeOwnerSubscriptionManager->getSubscriptionCurrent($ownerID);
    }

    public function getNextSubscription($ownerID)
    {
        return $this->storeOwnerSubscriptionManager->getNextSubscription($ownerID);
    }

    public function storeOwnerSubscriptionBalance($ownerID)
    {
        $subscribe = $this->getSubscriptionCurrent($ownerID);
        if ($subscribe) {
            return $this->checkSubscription($ownerID, $subscribe['id']);
        }

    }

    public function totalAmountOfSubscriptions($ownerID)
    {
        $items = $this->storeOwnerSubscriptionManager->totalAmountOfSubscriptions($ownerID);
        foreach($items as $item)
        {
            if (isset($result[$item['totalAmountOfSubscriptions']]))
            {
                $result[$item['totalAmountOfSubscriptions']] += $item['totalAmountOfSubscriptions'];
            }
            else
            {
                $result[$item['totalAmountOfSubscriptions']] = $item['totalAmountOfSubscriptions'];
            }
        }
        if ($items ) {
            return array_sum($result);
        }
        return 0;    
    }  
}
