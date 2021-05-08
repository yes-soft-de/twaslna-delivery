<?php

namespace App\Request;

class ClientProfileUpdateRequest
{
    private $id;

    private $userID;

    private $userName;

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
    public function getUserID()
    {
        return $this->userID;
    }

    /**
     * @param mixed $userID
     */
    public function setUserID($userID): void
    {
        $this->userID = $userID;
    }

    /**
     * @return mixed
     */
    public function getUserName()
    {
        return $this->userName;
    }

    /**
     * @param mixed $userName
     */
    public function setUserName($userName): void
    {
        $this->userName = $userName;
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
