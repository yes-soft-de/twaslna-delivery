<?php

namespace App\Request;

class StoreOwnerProfileCreateRequest
{
    private $storeOwnerID;

    private $storeOwnerName;

    // private $story;

    private $image;

    private $is_best;
    
    private $city;

    private $roomID;
    
    private $phone;

    private $storeCategoryId;

    /**
     * @return mixed
     */
    public function getStoreOwnerID()
    {
        return $this->storeOwnerID;
    }

    /**
     * @param mixed $storeOwnerID
     */
    public function setStoreOwnerID($storeOwnerID): void
    {
        $this->storeOwnerID = $storeOwnerID;
    }

    /**
     * @return mixed
     */
    public function getStoreOwnerName()
    {
        return $this->storeOwnerName;
    }

    /**
     * @param mixed $storeOwnerName
     */
    public function setStoreOwnerName($storeOwnerName): void
    {
        $this->storeOwnerName = $storeOwnerName;
    }

    // /**
    //  * @return mixed
    //  */
    // public function getStory()
    // {
    //     return $this->story;
    // }

    // /**
    //  * @param mixed $story
    //  */
    // public function setStory($story): void
    // {
    //     $this->story = $story;
    // }

    // /**
    //  * @return mixed
    //  */
    // public function getImage()
    // {
    //     return $this->image;
    // }

    // /**
    //  * @param mixed $image
    //  */
    // public function setImage($image): void
    // {
    //     $this->image = $image;
    // }

    public function getRoomID(): ?string
    {
        return $this->roomID;
    }

    public function setRoomID(?string $roomID): self
    {
        $this->roomID = $roomID;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param mixed $image
     */
    public function setImage($image): void
    {
        $this->image = $image;
    }


    /**
     * Get the value of storeCategoryId
     */ 
    public function getStoreCategoryId()
    {
        return $this->storeCategoryId;
    }

    /**
     * Set the value of storeCategoryId
     *
     * @return  self
     */ 
    public function setStoreCategoryId($storeCategoryId)
    {
        $this->storeCategoryId = $storeCategoryId;

        return $this;
    }

    /**
     * Get the value of is_best
     */ 
    public function getIs_best()
    {
        return $this->is_best;
    }

    /**
     * Set the value of is_best
     *
     * @return  self
     */ 
    public function setIs_best($is_best)
    {
        $this->is_best = $is_best;

        return $this;
    }
}
