<?php

namespace App\Entity;

use App\Repository\OrderNumberEntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=OrderNumberEntityRepository::class)
 */
class OrderNumberEntity
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
    private $orderNumber;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $orderID;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrderNumber(): ?string
    {
        return $this->orderNumber;
    }

    public function setOrderNumber(?string $orderNumber): self
    {
        $this->orderNumber = $orderNumber;

        return $this;
    }

    public function getOrderID(): ?int
    {
        return $this->orderID;
    }

    public function setOrderID(?int $orderID): self
    {
        $this->orderID = $orderID;

        return $this;
    }
}
