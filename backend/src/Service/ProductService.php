<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\ProductEntity;
use App\Manager\ProductManager;
use App\Request\ProductCreateRequest;
use App\Response\ProductCreateResponse;
use App\Response\ProductsResponse;
use App\Response\ProductFullInfoResponse;
use App\Response\ProductsByProductCategoryIdResponse;

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

    public function getProductsByProductCategoryId($productCategoryID)
    {
        $response = [];
        $items = $this->productManager->getProductsByProductCategoryId($productCategoryID);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsByProductCategoryIdResponse::class, $item);
            }  
        return $response;
    }

    public function getProductsByCategoryIdAndStoreOwnerProfileId($productCategoryID, $storeOwnerProfileId)
    {
        $response = [];
        $items = $this->productManager->getProductsByCategoryIdAndStoreOwnerProfileId($productCategoryID, $storeOwnerProfileId);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsByProductCategoryIdResponse::class, $item);
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

    public function getProductByIdWithFullInfo($id)
    {
       $item = $this->productManager->getProductByIdWithFullInfo($id);
       return $this->autoMapping->map('array', ProductFullInfoResponse::class, $item);
    }

    public function getProductsTopWanted():?array
    {
       $response=[];
 
       $Products = $this->productManager->getProductsTopWanted();
    
        foreach ($Products as $Product) {
         
            $topOwner['imageURL'] = $Product['image'];
            // $topOwner['image'] = $this->params.$Product['image'];
            // $topOwner['baseURL'] = $this->params;
           
            $response[] = $this->autoMapping->map('array', ProductFullInfoResponse::class, $Product);
        }
    
       return $response;
   }
   
    public function productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId):?array
    {
       $response=[];
 
       $Products = $this->productManager->productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId);
   
        foreach ($Products as $Product) {
         
            $topOwner['imageURL'] = $Product['image'];
            // $topOwner['image'] = $this->params.$Product['image'];
            // $topOwner['baseURL'] = $this->params;
           
            $response[] = $this->autoMapping->map('array', ProductFullInfoResponse::class, $Product);
        }
    
       return $response;
   }
   
    public function getPproductByProductIdAndStoreOwnerProfileId($storeOwnerProfileId, $productId):?array
    {
       $response = [];
       $product = $this->productManager->getPproductByProductIdAndStoreOwnerProfileId($storeOwnerProfileId, $productId);
       $response[] = $this->autoMapping->map('array', ProductFullInfoResponse::class, $product);
       return $response;
   }
}
