<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderNumberEntity;
use App\Manager\OrderNumberManager;
use App\Response\OrderNumberResponse;

class OrderNumberService
{
    private $autoMapping;
    private $orderNumberManager;

    public function __construct(AutoMapping $autoMapping, OrderNumberManager $orderNumberManager)
    {
        $this->autoMapping = $autoMapping;
        $this->orderNumberManager = $orderNumberManager;
    }

    public function createOrderNumber($orderID, $orderNumber)
    {
        $item['orderID'] = $orderID;
        $item['orderNumber'] = $orderNumber;
        
        $result = $this->orderNumberManager->createOrderNumber($item);

        return $this->autoMapping->map(OrderNumberEntity::class, OrderNumberResponse::class, $result);
    }
    
    public function getLastOrderNumber()
    {
       return $this->orderNumberManager->getLastOrderNumber();
    }

    public function getOrderIdByOrderNumber($orderNumber)
    {
       return $this->orderNumberManager->getOrderIdByOrderNumber($orderNumber);
    }
}
