<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\StoreCategoryEntity;
use App\Manager\StoreCategoryManager;
use App\Request\StoreCategoryCreateRequest;
use App\Response\StoreCategoryCreateResponse;
use App\Response\StoreCategoriesResponse;

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
}
