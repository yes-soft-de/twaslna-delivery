<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProductEntity;
use App\Manager\ProductManager;
use App\Request\ProductCreateRequest;
use App\Response\ProductCreateResponse;
use App\Response\ProductsResponse;

class ProductService
{
    private $autoMapping;
    private $productManager;

    public function __construct(AutoMapping $autoMapping, ProductManager $productManager)
    {
        $this->autoMapping = $autoMapping;
        $this->productManager = $productManager;
    }

    public function createProductByAdmin(ProductCreateRequest $request)
    {
        $item = $this->productManager->createProductByAdmin($request);

        return $this->autoMapping->map(ProductEntity::class, ProductCreateResponse::class, $item);
    }

    public function createProductByStoreOwner(ProductCreateRequest $request, $userID)
    {
        $storeOwnerProfileID = $this->getStoreOwnerProfileByStoreOwnerID($userID);

        $item = $this->productManager->createProductByStoreOwner($request);
        $request->setStoreOwnerProfileID($storeOwnerProfileID);
        
        return $this->autoMapping->map(ProductEntity::class, ProductCreateResponse::class, $item);
    }

    public function getProductsbystoreowner($userID)
    {
        $storeOwnerProfileID = $this->getStoreOwnerProfileByStoreOwnerID($userID);

        $items = $this->productManager->getProductsbyStoreOwnerProfile($storeOwnerProfileID[0]['id']);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsResponse::class, $item);
            }  
        return $response;
    }

    public function getProductsbyStoreOwnerProfile($id)
    {
        $response = [];
        $items = $this->productManager->getProductsbyStoreOwnerProfile($id);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsResponse::class, $item);
            }  
        return $response;
    }

    public function getProducts()
    {
        $items = $this->productManager->getProducts();
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsResponse::class, $item);
            }  
        return $response;
    }

    public function getProductById($id)
    {
       $item = $this->productManager->getProductById($id);
       return $this->autoMapping->map('array', ProductsResponse::class, $item);
    }

    public function getStoreOwnerProfileByStoreOwnerID($userID)
    {
        return $this->productManager->getStoreOwnerProfileByStoreOwnerID($userID);
    }
}
