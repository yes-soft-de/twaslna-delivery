<?php

namespace App\Entity;

use App\Repository\StoreProductEntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StoreProductEntityRepository::class)
 */
class StoreProductEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $storeOwnerProfileID;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $productID;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $productPrice;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStoreOwnerProfileID(): ?int
    {
        return $this->storeOwnerProfileID;
    }

    public function setStoreOwnerProfileID(?int $storeOwnerProfileID): self
    {
        $this->storeOwnerProfileID = $storeOwnerProfileID;

        return $this;
    }

    public function getProductID(): ?int
    {
        return $this->productID;
    }

    public function setProductID(?int $productID): self
    {
        $this->productID = $productID;

        return $this;
    }

    public function getProductPrice(): ?float
    {
        return $this->productPrice;
    }

    public function setProductPrice(?float $productPrice): self
    {
        $this->productPrice = $productPrice;

        return $this;
    }
}
