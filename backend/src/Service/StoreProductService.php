<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\StoreProductEntity;
use App\Manager\StoreProductManager;
use App\Request\StoreProductCreateRequest;
use App\Response\StoreProductCreateResponse;
use App\Response\StoreProductsByStoreOwnerProfileIdResponse;

class StoreProductService
{
    private $autoMapping;
    private $storeProductManager;

    public function __construct(AutoMapping $autoMapping, StoreProductManager $storeProductManager)
    {
        $this->autoMapping = $autoMapping;
        $this->storeProductManager = $storeProductManager;
    }

    public function createStoreProductByAdmin(StoreProductCreateRequest $request)
    {
        $products = $request->getProducts();
        foreach ($products as $product) {
           $request->setProductID($product['productID']);
           $request->setProductPrice($product['productPrice']);
           $item = $this->storeProductManager->createStoreProductByAdmin($request);
        }
        return $this->autoMapping->map(StoreProductEntity::class, StoreProductCreateResponse::class, $item);
    }
 
    public function createStoreProductByStoreOwner(StoreProductCreateRequest $request, $id)
    {
        $products = $request->getProducts();
        foreach ($products as $product) {
           $request->setProductID($product['productID']);
           $request->setProductPrice($product['productPrice']);
           $request->setStoreOwnerProfileID($id);
           $item = $this->storeProductManager->createStoreProductByStoreOwner($request);
        }
        
        return $this->autoMapping->map(StoreProductEntity::class, StoreProductCreateResponse::class, $item);
    }

    public function storeProductsByStoreOwnerId($id)
    {
        $items = $this->storeProductManager->storeProductsByStoreOwnerProfileId($id);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', StoreProductsByStoreOwnerProfileIdResponse::class, $item);
            }  
        return $response;
    }

    public function getStoreProductsByProfileId($storeOwnerProfileId)
    {
        $response = [];
        $items = $this->storeProductManager->storeProductsByStoreOwnerProfileId($storeOwnerProfileId);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', StoreProductsByStoreOwnerProfileIdResponse::class, $item);
            }  
        return $response;
    }
}