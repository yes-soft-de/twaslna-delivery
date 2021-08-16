<?php

namespace App\Service;

use App\AutoMapping;
use App\Manager\OrderManager;
use App\Response\OrderResponse;
use App\Service\OrderLogService;

class CaptainService
{
    private $autoMapping;
    private $orderManager;
    private $orderLogService;

    public function __construct(AutoMapping $autoMapping, OrderManager $orderManager, OrderLogService $orderLogService)
    {
        $this->autoMapping = $autoMapping;
        $this->orderManager = $orderManager;
        $this->orderLogService = $orderLogService;
    }

    public function countCaptainOrdersDelivered($captainId)
    {
        return $this->orderManager->countCaptainOrdersDelivered($captainId);
    }

    public function captainOrdersDelivered($captainId)
    {
        return $this->orderManager->captainOrdersDelivered($captainId);
    }

    public function countOrdersInMonthForCaptain($fromDate, $toDate, $captainId)
    {
        return $this->orderManager->countOrdersInMonthForCaptain($fromDate, $toDate, $captainId);
    }

    public function getAcceptedOrderByCaptainIdInMonth($fromDate, $toDate, $captainId)
    {
        return $this->orderManager->getAcceptedOrderByCaptainIdInMonth($fromDate, $toDate, $captainId);
    }

    public function countCaptainOrdersInDay($captainID, $fromDate, $toDate)
    {
        return $this->orderManager->countCaptainOrdersInDay($captainID, $fromDate, $toDate);
    }

    public function countOrdersDeliveredInToday($captainID, $todayStart, $todayEnd)
    {
        return $this->orderManager->countOrdersDeliveredInToday($captainID, $todayStart, $todayEnd);
    }

    public function getOrderKilometers($captainId)
    {
        return $this->orderManager->getOrderKilometers($captainId);
    }

    public function getOrderKilometersInThisMonth($captainId, $fromDate, $toDate)
    {
        return $this->orderManager->getOrderKilometersInThisMonth($captainId, $fromDate, $toDate);
    }
    
}
