<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ProductEntity;
use App\Repository\ProductEntityRepository;
use App\Request\ProductCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class ProductManager
{
    private $autoMapping;
    private $entityManager;
    private $productEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ProductEntityRepository $productEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->productEntityRepository = $productEntityRepository;
    }

    public function createProductByAdmin(ProductCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ProductCreateRequest::class, ProductEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function createProductByStoreOwner(ProductCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ProductCreateRequest::class, ProductEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getStoreOwnerProfileByUserID($userID)
    {
        return $this->productEntityRepository->getStoreOwnerProfileByUserID($userID);
    }

    public function getProductsbyStoreOwnerProfile($storeOwnerProfileID)
    {
        return $this->productEntityRepository->getProductsbyStoreOwnerProfile($storeOwnerProfileID);
    }

    public function getProducts()
    {
        return $this->productEntityRepository->getProducts();
    }
}
