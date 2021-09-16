<?php

namespace App\Request;

class OrderCreateRequest
{
    private $ownerID;
  
    private $source = [];
  
    private $destination = [];
  
    private $deliveryDate;
  
    private $note;
  
    private $payment;
  
    private $recipientName;
  
    private $recipientPhone;
  
    private $state;
  
    private $branchId;
  
    private $roomID;
  
    private $subscribeId;
  
    private $clientID;
  
    private $productID;
  
    private $countProduct;

     /**
     * @param mixed $ownerID
     */
    public function setOwnerID($ownerID): void
    {
        $this->ownerID = $ownerID;
    }

     /**
     * @return mixed
     */
    public function getOwnerID()
    {
        return $this->ownerID;
    }

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(?string $state): self
    {
        $this->state = $state;

        return $this;
    }

    public function getRoomID(): ?string
    {
        return $this->roomID;
    }

    public function setRoomID(?string $roomID): self
    {
        $this->roomID = $roomID;

        return $this;
    }
    
    public function getSubscribeId(): ?int
    {
        return $this->subscribeId;
    }

    public function setSubscribeId(?int $subscribeId): self
    {
        $this->subscribeId = $subscribeId;

        return $this;
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
    public function getClientID()
    {
        return $this->clientID;
    }

    /**
     * Get the value of productID
     */ 
    public function getProductID()
    {
        return $this->productID;
    }

    /**
     * Set the value of productID
     *
     * @return  self
     */ 
    public function setProductID($productID)
    {
        $this->productID = $productID;

        return $this;
    }

    /**
     * Get the value of countProduct
     */ 
    public function getCountProduct()
    {
        return $this->countProduct;
    }

    /**
     * Set the value of countProduct
     *
     * @return  self
     */ 
    public function setCountProduct($countProduct)
    {
        $this->countProduct = $countProduct;

        return $this;
    }
}
