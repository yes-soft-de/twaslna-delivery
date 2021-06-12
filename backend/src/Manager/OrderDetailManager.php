<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderDetailEntity;
use App\Repository\OrderDetailEntityRepository;
use Doctrine\ORM\EntityManagerInterface;

class OrderDetailManager
{
    private $autoMapping;
    private $entityManager;
    private $orderDetailEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderDetailEntityRepository $orderDetailEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderDetailEntityRepository = $orderDetailEntityRepository;
    }

    public function createOrderDetail($item)
    {
        $orderDetailEntity = $this->autoMapping->map('array', OrderDetailEntity::class, $item);
        
        $this->entityManager->persist($orderDetailEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $orderDetailEntity;
    }

    public function getLastOrderNumber()
    {
       return $this->orderDetailEntityRepository->getLastOrderNumber();
    }

    public function getOrderIdByOrderNumber($orderNumber)
    {
       return $this->orderDetailEntityRepository->getOrderIdByOrderNumber($orderNumber);
    }
}
