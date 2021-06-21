<?php

namespace App\Request;

class ProductCategoryCreateRequest
{
    private $ProductCategoryName;


    /**
     * Get the value of ProductCategoryName
     */ 
    public function getProductCategoryName()
    {
        return $this->ProductCategoryName;
    }

    /**
     * Set the value of ProductCategoryName
     *
     * @return  self
     */ 
    public function setProductCategoryName($ProductCategoryName)
    {
        $this->ProductCategoryName = $ProductCategoryName;

        return $this;
    }
}
