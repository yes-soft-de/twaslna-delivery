<?php

namespace App\Request;

class ClientProfileUpdateRequest
{
    private $id;

    private $clientID;

    private $clientName;

    private $image;

    private $uuid;
    
    private $phone;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getClientID()
    {
        return $this->clientID;
    }

    /**
     * @param mixed $clientID
     */
    public function setClientID($clientID): void
    {
        $this->clientID = $clientID;
    }

     /**
     * @return mixed
     */
    public function getClientName()
    {
        return $this->clientName;
    }

    /**
     * @param mixed $clientName
     */
    public function setClientName($clientName): void
    {
        $this->clientName = $clientName;
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


    /**
     * Get the value of phone
     */ 
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set the value of phone
     *
     * @return  self
     */ 
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }
}
