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

    public function getStoreOwnerProfileByStoreOwnerID($userID)
    {
        return $this->productEntityRepository->getStoreOwnerProfileByStoreOwnerID($userID);
    }

    public function getProductsByStoreOwnerProfile($storeOwnerProfileID)
    {
        return $this->productEntityRepository->getProductsByStoreOwnerProfile($storeOwnerProfileID);
    }

    public function getProductsByProductCategoryId($productCategoryID)
    {
        return $this->productEntityRepository->getProductsByProductCategoryId($productCategoryID);
    }

    public function getProductsByCategoryIdAndStoreOwnerProfileId($productCategoryID, $storeOwnerProfileId)
    {
        return $this->productEntityRepository->getProductsByCategoryIdAndStoreOwnerProfileId($productCategoryID, $storeOwnerProfileId);
    }

    public function getProducts()
    {
        return $this->productEntityRepository->getProducts();
    }

    public function getProductById($id)
    {
        return $this->productEntityRepository->getProductById($id);
    }

    public function getProductByIdWithFullInfo($id)
    {
        return $this->productEntityRepository->getProductByIdWithFullInfo($id);
    }

    public function getProductsTopWanted()
    {
        return $this->productEntityRepository->getProductsTopWanted();
    }

    public function productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId)
    {
        return $this->productEntityRepository->productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId);
    }
}
