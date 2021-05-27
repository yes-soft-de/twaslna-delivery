<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderLogEntity;
use App\Manager\OrderLogManager;
use App\Response\OrderLogResponse;
use App\Service\DateFactoryService;
class OrderLogService
{
    private $autoMapping;
    private $orderlogManager;
    private $dateFactoryService;

    public function __construct(AutoMapping $autoMapping, OrderLogManager $orderlogManager, DateFactoryService $dateFactoryService)
    {
        $this->autoMapping = $autoMapping;
        $this->orderlogManager = $orderlogManager;
        $this->dateFactoryService = $dateFactoryService;
    }

    public function createOrderLog($orderID, $state, $userID)
    {
        $item['orderID'] = $orderID;
        $item['state'] = $state;
        $item['userID'] = $userID;
        
        $result = $this->orderlogManager->createOrderLog($item);

        return $this->autoMapping->map(OrderLogEntity::class, OrderLogResponse::class, $result);
    }
    
    public function getOrderLogByOrderId($orderId)
    {
        return $this->orderlogManager->getOrderLogByOrderId($orderId);
    }

    public function getLogsByOrderId($orderId)
    {
        return $this->orderlogManager->getLogsByOrderId($orderId);
    }

    public function getOrderLogsWithcompletionTime($orderId)
    {
        $response=[];
        $items = $this->getLogsByOrderId($orderId);
     
        foreach ($items as $item) {
         
            $firstDate = $this->getFirstDate($item['orderID']); 
            $lastDate = $this->getLastDate($item['orderID']);
           
            if($firstDate[0]['date'] && $lastDate[0]['date']) {
                $state['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']);
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

    public function getFirstDate($orderId)
    {
        return $this->orderlogManager->getFirstDate($orderId);
    }

    public function getLastDate($orderId)
    {
        return $this->orderlogManager->getLastDate($orderId);
    } 

    public function getOrderLogsByStoreOwner($ownerID):array
    {
        $response = [];
      
        $items = $this->orderlogManager->getOrderIdByOwnerId($ownerID);
     
            foreach ($items as $item) {
                $item['log'] = $this->getLogsByOrderId($item['orderID']);
               
                $firstDate = $this->getFirstDate($item['orderID']); 
                $lastDate = $this->getLastDate($item['orderID']);
               
                $item['currentStage'] =  $lastDate;
                if($firstDate[0]['date'] && $lastDate[0]['date']) {
                    $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']);
                }
                $response[] = $this->autoMapping->map('array', OrderLogResponse::class, $item);
            }
            return $response;
    }

    public function getOrderLogsByCaptain($captainID):array
    {
         $response = [];
      
        $items = $this->orderlogManager->getOrderIdByCaptainId($captainID);
   
            foreach ($items as $item) {
                $item['log'] = $this->getLogsByOrderId($item['orderID']);
               
                $firstDate = $this->getFirstDate($item['orderID']); 
                $lastDate = $this->getLastDate($item['orderID']);
               
                $item['currentStage'] =  $lastDate;
                if($firstDate[0]['date'] && $lastDate[0]['date']) {
                    $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']);
                }
                $response[] = $this->autoMapping->map('array', OrderLogResponse::class, $item);
            }
            return $response;
    }

}
