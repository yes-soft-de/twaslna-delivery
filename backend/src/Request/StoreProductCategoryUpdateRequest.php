<?php

namespace App\Request;

class StoreProductCategoryUpdateRequest
{
    private $id;
    private $productCategoryName;
    private $storeOwnerProfileId;
    private $productCategoryImage;


    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

    /**
     * Get the value of ProductCategoryName
     */ 
    public function getProductCategoryName()
    {
        return $this->productCategoryName;
    }

    /**
     * Set the value of ProductCategoryName
     *
     * @return  self
     */ 
    public function setProductCategoryName($productCategoryName)
    {
        $this->productCategoryName = $productCategoryName;

        return $this;
    }

    /**
     * Get the value of storeOwnerProfileId
     */ 
    public function getStoreOwnerProfileId()
    {
        return $this->storeOwnerProfileId;
    }

    /**
     * Set the value of storeOwnerProfileId
     *
     * @return  self
     */ 
    public function setStoreOwnerProfileId($storeOwnerProfileId)
    {
        $this->storeOwnerProfileId = $storeOwnerProfileId;

        return $this;
    }

    /**
     * Get the value of ProductCategoryImage
     */ 
    public function getProductCategoryImage()
    {
        return $this->productCategoryImage;
    }

    /**
     * Set the value of ProductCategoryImage
     *
     * @return  self
     */ 
    public function setProductCategoryImage($productCategoryImage)
    {
        $this->productCategoryImage = $productCategoryImage;

        return $this;
    }
}
