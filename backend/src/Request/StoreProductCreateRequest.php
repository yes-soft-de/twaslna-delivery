<?php

namespace App\Request;

class StoreProductCreateRequest
{
    private $storeOwnerProfileID;
    private $productID;
    private $productPrice;


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
     * Get the value of productID
     */ 
    public function getProductID()
    {
        return $this->productID;
    }

    /**
     * Set the value of productID
     *
     * @return  self
     */ 
    public function setProductID($productID)
    {
        $this->productID = $productID;

        return $this;
    }

    /**
     * Get the value of productPrice
     */ 
    public function getProductPrice()
    {
        return $this->productPrice;
    }

    /**
     * Set the value of productPrice
     *
     * @return  self
     */ 
    public function setProductPrice($productPrice)
    {
        $this->productPrice = $productPrice;

        return $this;
    }
}
