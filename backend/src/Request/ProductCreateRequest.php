<?php

namespace App\Request;

class ProductCreateRequest
{
    private $productName;
    private $productImage;
    private $productPrice;
    private $storeOwnerProfileID;
    private $ProductCategoryID;

    /**
     * Get the value of storeOwnerProfileID
     */ 
    public function getStoreOwnerProfileID()
    {
        return $this->storeOwnerProfileID;
    }

    /**
     * Set the value of storeOwnerProfileID
     *
     * @return  self
     */ 
    public function setStoreOwnerProfileID($storeOwnerProfileID)
    {
        $this->storeOwnerProfileID = $storeOwnerProfileID;

        return $this;
    }

    /**
     * Get the value of ProductCategoryID
     */ 
    public function getProductCategoryID()
    {
        return $this->ProductCategoryID;
    }

    /**
     * Set the value of ProductCategoryID
     *
     * @return  self
     */ 
    public function setProductCategoryID($ProductCategoryID)
    {
        $this->ProductCategoryID = $ProductCategoryID;

        return $this;
    }
}
