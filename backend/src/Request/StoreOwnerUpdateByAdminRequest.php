<?php

namespace App\Request;

class StoreOwnerUpdateByAdminRequest
{
    private $id;
    private $status;
    private $is_best;

    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }
}
