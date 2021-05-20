<?php

namespace App\Request;

class StoreOwnerBranchUpdateRequest
{
    private $id;
    private $location = [];
    private $city;
    private $brancheName;
      
    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }
}
