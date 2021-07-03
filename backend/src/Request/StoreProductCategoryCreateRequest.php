<?php

namespace App\Request;

class StoreProductCategoryCreateRequest
{
    // {
    //     "items":{
    //         "item1":{
    //                 "storeOwnerProfileId": 1,
    //                 "productCategoryId":2
    //         },
    //         "item2":{
    //                 "storeOwnerProfileId": 1,
    //                 "productCategoryId":2
    //         }
    //     } 
    // }
    private $items;


    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }

    /**
     * Get the value of items
     */ 
    public function getItems()
    {
        return $this->items;
    }

    /**
     * Set the value of items
     *
     * @return  self
     */ 
    public function setItems($items)
    {
        $this->items = $items;

        return $this;
    }
}
