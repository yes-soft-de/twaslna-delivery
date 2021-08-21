<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\ProductCategoryEntity;
use App\Repository\ProductCategoryEntityRepository;
use App\Request\ProductCategoryCreateRequest;
use App\Request\ProductCategoryUpdateRequest;
use App\Request\DeleteRequest;
use Doctrine\ORM\EntityManagerInterface;

class ProductCategoryManager
{
    private $autoMapping;
    private $entityManager;
    private $productCategoryEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, ProductCategoryEntityRepository $productCategoryEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->productCategoryEntityRepository = $productCategoryEntityRepository;
    }

    public function createStoreCategory(ProductCategoryCreateRequest $request)
    {
        $entity = $this->autoMapping->map(ProductCategoryCreateRequest::class, ProductCategoryEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function updateProductCategory(ProductCategoryUpdateRequest $request)
    {
        $related = $this->productCategoryEntityRepository->areThereItemsRelatedToThisCategory($request->getId());
       
        if ($related) {
            return 'has items';
        }
        
        $entity = $this->productCategoryEntityRepository->find($request->getId());

        if (!$entity) {
            return null;
        }
        $entity = $this->autoMapping->mapToObject(ProductCategoryUpdateRequest::class, ProductCategoryEntity::class, $request, $entity);

        $this->entityManager->flush();

        return $entity;
    }

    public function getProductCategories()
    {
       return $this->productCategoryEntityRepository->findAll();
    }

    public function getProductCategory($id)
    {
       return $this->productCategoryEntityRepository->find($id);
    }

    public function delete(DeleteRequest $request)
    {
        $related = $this->productCategoryEntityRepository->areThereItemsRelatedToThisCategory($request->getId());
       
        if ($related) {
            return 'has items';
        }

        $item = $this->productCategoryEntityRepository->find($request->getId());
        if (!$item )
        {
            return null;
        }
        else
         {
            $this->entityManager->remove($item);
            $this->entityManager->flush();
         }
         return $item;
    }
}
