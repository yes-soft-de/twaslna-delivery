<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\StoreProductEntity;
use App\Repository\StoreProductEntityRepository;
use App\Request\StoreProductCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class StoreProductManager
{
    private $autoMapping;
    private $entityManager;
    private $storeProductEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, StoreProductEntityRepository $storeProductEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->storeProductEntityRepository = $storeProductEntityRepository;
    }

    public function createStoreProductByAdmin(StoreProductCreateRequest $request)
    {
        $entity = $this->autoMapping->map(StoreProductCreateRequest::class, StoreProductEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function createStoreProductByStoreOwner(StoreProductCreateRequest $request)
    {
        $entity = $this->autoMapping->map(StoreProductCreateRequest::class, StoreProductEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getStoreOwnerProfileByStoreOwnerID($userID)
    {
        return $this->storeProductEntityRepository->getStoreOwnerProfileByStoreOwnerID($userID);
    }

    public function storeProductsByStoreOwnerProfileId($storeOwnerProfileID)
    {
        return $this->storeProductEntityRepository->storeProductsByStoreOwnerProfileId($storeOwnerProfileID);
    }
}
