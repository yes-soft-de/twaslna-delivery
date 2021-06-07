<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderNumberEntity;
use App\Repository\OrderNumberEntityRepository;
use Doctrine\ORM\EntityManagerInterface;

class OrderNumberManager
{
    private $autoMapping;
    private $entityManager;
    private $orderNumberEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderNumberEntityRepository $orderNumberEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderNumberEntityRepository = $orderNumberEntityRepository;
    }

    public function createOrderNumber($item)
    {
        $orderNumberEntity = $this->autoMapping->map('array', OrderNumberEntity::class, $item);
        
        $this->entityManager->persist($orderNumberEntity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $orderNumberEntity;
    }

    public function getLastOrderNumber()
    {
       return $this->orderNumberEntityRepository->getLastOrderNumber();
    }

    public function getOrderIdByOrderNumber($orderNumber)
    {
       return $this->orderNumberEntityRepository->getOrderIdByOrderNumber($orderNumber);
    }
}
