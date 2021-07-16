<?php

namespace App\Request;

class StoreOwnerUpdateByAdminRequest
{
    private $id;

    private $storeOwnerName;

    private $status;

    private $is_best;

    private $image;

    private $storeCategoryId;

    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }
}
