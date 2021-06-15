<?php

namespace App\Request;

class ProductCategoryUpdateRequest
{
    private $id;
    private $ProductCategoryName;



    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */ 
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

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
