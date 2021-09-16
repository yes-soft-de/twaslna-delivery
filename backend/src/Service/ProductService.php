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

    public function getProductsByProductCategoryId($storeProductCategoryID)
    {
        $response = [];
        $items = $this->productManager->getProductsByProductCategoryId($storeProductCategoryID);
        foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsByProductCategoryIdResponse::class, $item);
            }  
        return $response;
    }

    public function getProductsByCategoryIdAndStoreOwnerProfileId($storeProductCategoryID, $storeOwnerProfileId)
    {
        $response = [];
        $items = $this->productManager->getProductsByCategoryIdAndStoreOwnerProfileId($storeProductCategoryID, $storeOwnerProfileId);
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
            $img = isset($Product['image']);
            if ($img){
                $topOwner['imageURL'] = $Product['image'];
            }
            $response[] = $this->autoMapping->map('array', ProductFullInfoResponse::class, $Product);
        }
    
       return $response;
   }
   
    public function productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId):?array
    {
       $response=[];
 
       $Products = $this->productManager->productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId);
   
        foreach ($Products as $Product) {
            $img = isset($Product['image']);
            if ($img){
                $topOwner['imageURL'] = $Product['image'];
            }
           
            $response[] = $this->autoMapping->map('array', ProductFullInfoResponse::class, $Product);
        }
    
       return $response;
   }
   
    public function getProductByProductIdAndStoreOwnerProfileId($storeOwnerProfileId, $productId):?array
    {
       $response = [];
       $product = $this->productManager->getProductByProductIdAndStoreOwnerProfileId($storeOwnerProfileId, $productId);
       $response[] = $this->autoMapping->map('array', ProductFullInfoResponse::class, $product);
       return $response;
   }
   
    public function getStoreProductsByProfileId($storeOwnerProfileId):?array
    {
       $response = [];
       $items = $this->productManager->getStoreProductsByProfileId($storeOwnerProfileId);
       foreach ($items as $item) {
            $response[] = $this->autoMapping->map('array', ProductsByProductCategoryIdResponse::class, $item);
       }
       return $response;
   }

   public function updateProductByAdmin($request)
   {
       $item = $this->productManager->updateProductByAdmin($request);

       return $this->autoMapping->map(ProductEntity::class, ProductCreateResponse::class, $item);
   }

   public function countProducts() {
    return $this->productManager->countProducts();
    }

    public function getProductsByName($name) {
        return $this->productManager->getProductsByName($name);
    }
}
