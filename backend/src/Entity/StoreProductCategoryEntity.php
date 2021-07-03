<?php

namespace App\Entity;

use App\Repository\StoreProductCategoryEntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StoreProductCategoryEntityRepository::class)
 */
class StoreProductCategoryEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $storeOwnerProfileId;

    /**
     * @ORM\Column(type="integer")
     */
    private $productCategoryId;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStoreOwnerProfileId(): ?int
    {
        return $this->storeOwnerProfileId;
    }

    public function setStoreOwnerProfileId(int $storeOwnerProfileId): self
    {
        $this->storeOwnerProfileId = $storeOwnerProfileId;

        return $this;
    }

    public function getProductCategoryId(): ?int
    {
        return $this->productCategoryId;
    }

    public function setProductCategoryId(int $productCategoryId): self
    {
        $this->productCategoryId = $productCategoryId;

        return $this;
    }
}
