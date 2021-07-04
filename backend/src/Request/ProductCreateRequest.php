<?php

namespace App\Request;

class ProductCreateRequest
{
    private $productName;
    private $productImage;
    private $ProductCategoryID;

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
