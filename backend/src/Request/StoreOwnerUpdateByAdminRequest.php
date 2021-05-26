<?php

namespace App\Request;

class StoreOwnerUpdateByAdminRequest
{
    private $id;
    private $status;
    private $free;

    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }
}
