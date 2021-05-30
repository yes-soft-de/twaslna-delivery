<?php

namespace App\Request;

class StoreCategoryCreateRequest
{
    private $StoreCategoryName;
    private $description;

    /**
     * Get the value of StoreCategoryName
     */ 
    public function getStoreCategoryName()
    {
        return $this->StoreCategoryName;
    }

    /**
     * Set the value of StoreCategoryName
     *
     * @return  self
     */ 
    public function setStoreCategoryName($StoreCategoryName)
    {
        $this->StoreCategoryName = $StoreCategoryName;

        return $this;
    }

    /**
     * Get the value of description
     */ 
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set the value of description
     *
     * @return  self
     */ 
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }
}
