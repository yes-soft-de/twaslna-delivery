<?php

namespace App\Request;

class DeliveryCompensationAndCostDeliveryCrateRequest
{
    private $kilometers;
    private $maxKilometerBonus;
    private $minKilometerBonus;
    private $deliveryCost;

    /**
     * Get the value of kilometers
     */ 
    public function getKilometers()
    {
        return $this->kilometers;
    }

    /**
     * Set the value of kilometers
     *
     * @return  self
     */ 
    public function setKilometers($kilometers)
    {
        $this->kilometers = $kilometers;

        return $this;
    }

    /**
     * Get the value of maxKilometerBonus
     */ 
    public function getMaxKilometerBonus()
    {
        return $this->maxKilometerBonus;
    }

    /**
     * Set the value of maxKilometerBonus
     *
     * @return  self
     */ 
    public function setMaxKilometerBonus($maxKilometerBonus)
    {
        $this->maxKilometerBonus = $maxKilometerBonus;

        return $this;
    }

    /**
     * Get the value of minKilometerBonus
     */ 
    public function getMinKilometerBonus()
    {
        return $this->minKilometerBonus;
    }

    /**
     * Set the value of minKilometerBonus
     *
     * @return  self
     */ 
    public function setMinKilometerBonus($minKilometerBonus)
    {
        $this->minKilometerBonus = $minKilometerBonus;

        return $this;
    }

    /**
     * Get the value of deliveryCost
     */ 
    public function getDeliveryCost()
    {
        return $this->deliveryCost;
    }

    /**
     * Set the value of deliveryCost
     *
     * @return  self
     */ 
    public function setDeliveryCost($deliveryCost)
    {
        $this->deliveryCost = $deliveryCost;

        return $this;
    }
}
