<?php

namespace App\Entity;

use App\Repository\ProductCategoryEntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProductCategoryEntityRepository::class)
 */
class ProductCategoryEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ProductCategoryName;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProductCategoryName(): ?string
    {
        return $this->ProductCategoryName;
    }

    public function setProductCategoryName(?string $ProductCategoryName): self
    {
        $this->ProductCategoryName = $ProductCategoryName;

        return $this;
    }
}
