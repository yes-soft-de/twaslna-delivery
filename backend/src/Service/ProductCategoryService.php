<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProductCategoryEntity;
use App\Manager\ProductCategoryManager;
use App\Request\ProductCategoryCreateRequest;
use App\Response\ProductCategoryResponse;

class ProductCategoryService
{
    private $autoMapping;
    private $productCategoryManager;

    public function __construct(AutoMapping $autoMapping, ProductCategoryManager $productCategoryManager)
    {
        $this->autoMapping = $autoMapping;
        $this->productCategoryManager = $productCategoryManager;
    }

    public function createProductCategory(ProductCategoryCreateRequest $request)
    {
        $item = $this->productCategoryManager->createStoreCategory($request);

        return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryResponse::class, $item);
    }

    public function updateProductCategory($request)
    {
        $item = $this->productCategoryManager->updateProductCategory($request);
       
        if (is_string($item)){ 
            return $item;
         }

        return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryResponse::class, $item);
    }

    public function getProductCategories():array
    {
       $response = [];
       $items = $this->productCategoryManager->getProductCategories();
       foreach ($items as $item) {  
           $response[] =  $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryResponse::class, $item);  
        }
      return $response;
    }

    public function getProductCategory($id)
    {
       $item = $this->productCategoryManager->getProductCategory($id);
       return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryResponse::class, $item);  
       
    }

    public function delete($request)
    {
        $result = $this->productCategoryManager->delete($request);

        if (is_string($result)){ 
            return $result;
         }

        if(!($result instanceof ProductCategoryEntity))
        {
            return $result;
        }

        return $this->autoMapping->map(ProductCategoryEntity::class, ProductCategoryResponse::class, $result);
    }
}
