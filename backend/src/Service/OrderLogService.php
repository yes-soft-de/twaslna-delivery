<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderLogEntity;
use App\Manager\OrderLogManager;
use App\Response\OrderLogResponse;
use App\Response\OrderLogCaptainResponse;
use App\Service\DateFactoryService;


class OrderLogService
{
    private $autoMapping;
    private $orderLogManager;
    private $dateFactoryService;

    public function __construct(AutoMapping $autoMapping, OrderLogManager $orderLogManager, DateFactoryService $dateFactoryService)
    {
        $this->autoMapping = $autoMapping;
        $this->orderLogManager = $orderLogManager;
        $this->dateFactoryService = $dateFactoryService;
    }

    public function createOrderLog($orderNumber, $state, $userID, $storeOwnerProfileID)
    {
        $item['orderNumber'] = $orderNumber;
        $item['state'] = $state;
        $item['userID'] = $userID;
        $item['storeOwnerProfileID'] = $storeOwnerProfileID;
        
        $result = $this->orderLogManager->createOrderLog($item);

        return $this->autoMapping->map(OrderLogEntity::class, OrderLogResponse::class, $result);
    }
    
    public function getOrderLogByOrderNumber($orderNumber)
    {
        return $this->orderLogManager->getOrderLogByOrderNumber($orderNumber);
    }

    public function getOrderLogsByOrderNumber($orderNumber)
    {
        return $this->orderLogManager->getOrderLogsByOrderNumber($orderNumber);
    }

    public function getOrderLogsWithCompletionTime($orderNumber)
    {
        $response=[];
        $items = $this->getOrderLogsByOrderNumber($orderNumber);
     
        foreach ($items as $item) {
         
            $firstDate = $this->getFirstDate($item['orderNumber']); 
            $lastDate = $this->getLastDate($item['orderNumber']);
           
            if($firstDate[0]['createdAt'] && $lastDate[0]['createdAt']) {
                $state['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['createdAt'], $lastDate[0]['createdAt']);
            }
            $log[] = $this->autoMapping->map('array', OrderLogResponse::class, $item);
        } 
        $state['currentStage'] = $lastDate[0]['state'] ;
        $orderStatus[] = $this->autoMapping->map('array', OrderLogResponse::class, $state);
        if($firstDate && $lastDate) {
            $response['orderStatus'] = $orderStatus ;
            $response['log'] = $log ;
            }
        return  $response;
    }

    public function getFirstDate($orderNumber)
    {
        return $this->orderLogManager->getFirstDate($orderNumber);
    }

    public function getLastDate($orderNumber)
    {
        return $this->orderLogManager->getLastDate($orderNumber);
    } 

    public function getOrderLogsByStoreOwner($ownerID):array
    {
        $response = [];
      
        $items = $this->orderLogManager->getOrderNumberByOwnerId($ownerID);
     
            foreach ($items as $item) {
                $item['log'] = $this->getOrderLogsByOrderNumber($item['OrderNumber']);
               
                $firstDate = $this->getFirstDate($item['OrderNumber']); 
                $lastDate = $this->getLastDate($item['OrderNumber']);
               
                $item['currentStage'] =  $lastDate;
                if($firstDate[0]['createdAt'] && $lastDate[0]['createdAt']) {
                    $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['createdAt'], $lastDate[0]['createdAt']);
                }
                $response[] = $this->autoMapping->map('array', OrderLogResponse::class, $item);
            }
            return $response;
    }

    public function getOrderLogsByCaptain($captainID):array
    {
         $response = [];
      
        $items = $this->orderLogManager->getOrderNumberByCaptainId($captainID);
   
            foreach ($items as $item) {
                $item['log'] = $this->getOrderLogsByOrderNumber($item['OrderNumber']);
               
                $firstDate = $this->getFirstDate($item['OrderNumber']); 
                $lastDate = $this->getLastDate($item['OrderNumber']);
               
                $item['currentStage'] =  $lastDate;
                if($firstDate[0]['date'] && $lastDate[0]['date']) {
                    $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']);
                }
                $response[] = $this->autoMapping->map('array', OrderLogResponse::class, $item);
            }
            return $response;
    }

    public function getClientOrderLogs($userID):array
    {
         $response = [];
      
        $items = $this->orderLogManager->getOrderNumberUserID($userID);
 
        foreach ($items as $item) {
            $firstDate = $this->getFirstDate($item['orderNumber']); 
            $lastDate = $this->getLastDate($item['orderNumber']);
           
            $item['currentStage'] =  $lastDate[0]['state'] ;
            if($firstDate[0]['createdAt'] && $lastDate[0]['createdAt']) {
                $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['createdAt'], $lastDate[0]['createdAt']);
                }
        $response[] = $this->autoMapping->map('array', OrderLogResponse::class, $item);
            }
            return $response;
    }

    public function getCaptainOrderLogs($userID)
    {
         $response = [];
      
        $items = $this->orderLogManager->getOrderNumberUserID($userID);
 
        foreach ($items as $item) {
            $firstDate = $this->getFirstDate($item['orderNumber']); 
            $lastDate = $this->getLastDate($item['orderNumber']);
            
            $item['currentStage'] = $lastDate[0]['state'] ;
          
            if($firstDate[0]['createdAt'] && $lastDate[0]['createdAt']) {
                $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['createdAt'], $lastDate[0]['createdAt']);
                }
          
        $response[] = $this->autoMapping->map("array", OrderLogCaptainResponse::class, $item);
            }
            return  $response;   
    }
}
