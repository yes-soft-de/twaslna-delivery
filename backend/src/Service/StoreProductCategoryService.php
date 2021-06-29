<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\StoreProductCategoryEntity;
use App\Manager\StoreProductCategoryManager;
use App\Request\StoreProductCategoryCreateRequest;
use App\Response\StoreProductCategoryCreateResponse;
use App\Response\StoreProductsCategoryResponse;

class StoreProductCategoryService
{
    private $autoMapping;
    private $storeProductCategoryManager;

    public function __construct(AutoMapping $autoMapping, StoreProductCategoryManager $storeProductCategoryManager)
    {
        $this->autoMapping = $autoMapping;
        $this->storeProductCategoryManager = $storeProductCategoryManager;
    }

    public function createStoreProductCategory(StoreProductCategoryCreateRequest $request)
    {
        $items = $request->getItems();
        foreach ($items as $item) {
          
            $request->storeOwnerProfileId = $item['storeOwnerProfileId'];
            $request->productCategoryId = $item['productCategoryId'];
            $item = $this->storeProductCategoryManager->createStoreProductCategory($request);
         }   
        return $this->autoMapping->map(StoreProductCategoryEntity::class, StoreProductCategoryCreateResponse::class, $item);
    }
//TODO
    // public function updateStoreCategory($request)
    // {
    //     $item = $this->storeProductCategoryManager->updateStoreCategory($request);

    //     return $this->autoMapping->map(StoreCategoryEntity::class, StoreCategoryCreateResponse::class, $item);
    // }

    public function getStoreProductsCategoryForStoreSpecific($storeOwnerProfileId)
    {
       $items = $this->storeProductCategoryManager->getStoreProductsCategoryForStoreSpecific($storeOwnerProfileId);
       foreach($items as $item) {
            $response[] = $this->autoMapping->map('array', StoreProductsCategoryResponse::class, $item); 
      } 
       return $response;
    }
}
