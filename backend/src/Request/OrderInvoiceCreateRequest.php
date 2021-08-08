<?php

namespace App\Request;

class OrderInvoiceCreateRequest
{
    private $captainID;
    private $orderNumber;
    private $amount;
    private $image;
      
    public function getCaptainID()
    {
        return $this->captainID;
    }

    public function setCaptainID($captainID)
    {
        $this->captainID = $captainID;

        return $this;
    }

    public function getOrderNumber()
    {
        return $this->orderNumber;
    }
 
    public function setOrderNumber($orderNumber)
    {
        $this->orderNumber = $orderNumber;

        return $this;
    }

    public function getAmount()
    {
        return $this->amount;
    }
 
    public function setAmount($amount)
    {
        $this->amount = $amount;

        return $this;
    }
 
    public function getImage()
    {
        return $this->image;
    }

    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }
}
