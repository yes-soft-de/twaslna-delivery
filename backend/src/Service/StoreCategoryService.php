<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\StoreCategoryEntity;
use App\Manager\StoreCategoryManager;
use App\Request\StoreCategoryCreateRequest;
use App\Response\StoreCategoryCreateResponse;
use App\Response\StoreCategoryByIdResponse;

class StoreCategoryService
{
    private $autoMapping;
    private $storeCategoryManager;

    public function __construct(AutoMapping $autoMapping, StoreCategoryManager $storeCategoryManager)
    {
        $this->autoMapping = $autoMapping;
        $this->storeCategoryManager = $storeCategoryManager;
    }

    public function createStoreCategory(StoreCategoryCreateRequest $request)
    {
        $item = $this->storeCategoryManager->createStoreCategory($request);

        return $this->autoMapping->map(StoreCategoryEntity::class, StoreCategoryCreateResponse::class, $item);
    }

    public function updateStoreCategory($request)
    {
        $item = $this->storeCategoryManager->updateStoreCategory($request);

        return $this->autoMapping->map(StoreCategoryEntity::class, StoreCategoryCreateResponse::class, $item);
    }

    public function getStoreCategories():array
    {
       $response = [];
       $items = $this->storeCategoryManager->getStoreCategories();
       foreach ($items as $item) {  
           $response[] =  $this->autoMapping->map(StoreCategoryEntity::class, StoreCategoryCreateResponse::class, $item);  
        }
      return $response;
    }

    public function getStoreCategory($id)
    {
       $item = $this->storeCategoryManager->getStoreCategory($id);
       return $this->autoMapping->map(StoreCategoryEntity::class, StoreCategoryByIdResponse::class, $item);  
       
    }
}
