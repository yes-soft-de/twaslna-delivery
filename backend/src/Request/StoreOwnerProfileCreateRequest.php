<?php

namespace App\Request;

class StoreOwnerProfileCreateRequest
{
    private $storeOwnerIDstoreOwnerID;

    private $storeOwnerName;

    // private $story;

    private $image;

    private $branch;
    
    private $city;

    private $uuid;
    
    private $phone;

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

    public function getUuid(): ?string
    {
        return $this->uuid;
    }

    public function setUuid(?string $uuid): self
    {
        $this->uuid = $uuid;

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

}
