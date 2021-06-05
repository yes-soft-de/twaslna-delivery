<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderLogEntity;
use App\Repository\OrderLogEntityRepository;
use Doctrine\ORM\EntityManagerInterface;

class OrderLogManager
{
    private $autoMapping;
    private $entityManager;
    private $orderLogEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderLogEntityRepository $orderlogEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderlogEntityRepository = $orderlogEntityRepository;
    }

    public function createOrderLog($log)
    {
        $orderlogEntity = $this->autoMapping->map('array', OrderLogEntity::class, $log);
        $orderlogEntity->setDate($orderlogEntity->getDate());
        
        $this->entityManager->persist($orderlogEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $orderlogEntity;
    }

    public function getOrderLogByOrderId($orderId)
    {
        return $this->orderLogEntityRepository->getOrderLogByOrderId($orderId);
    }

    public function getLogsByOrderId($orderId)
    {
        return $this->orderLogEntityRepository->getLogsByOrderId($orderId);
    }

    public function getFirstDate($orderId)
    {
        return $this->orderLogEntityRepository->getFirstDate($orderId);
    }
    
    public function getLastDate($orderId)
    {
        return $this->orderLogEntityRepository->getLastDate($orderId);
    }

    public function getOrderIdByOwnerId($ownerID)
    {
        return $this->orderLogEntityRepository->getOrderIdByOwnerId($ownerID);
    }

    public function getOrderIdByCaptainId($captainID)
    {
        return $this->orderLogEntityRepository->getOrderIdByCaptainId($captainID);
    }
}
