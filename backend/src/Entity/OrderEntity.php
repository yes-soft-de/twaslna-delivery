<?php

namespace App\Entity;

use App\Repository\OrderEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=OrderEntityRepository::class)
 */
class OrderEntity
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
    private $ownerID;

    /**
     * @ORM\Column(type="json", nullable=true)
     */
    private $source = [];

    /**
     * @ORM\Column(type="json")
     */
    private $destination = [];

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $deliveryDate;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $note;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $payment;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $recipientName;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $recipientPhone;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updateDate;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $state;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $fromBranch;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $uuid;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kilometer;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $subscribeId;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $captainID;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $clientID;

    /**
     * @ORM\Column(type="integer", length=255, nullable=true)
     */
    private $productID;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $createdAt;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(string $id): self
    {
        $this->id = $id;

        return $this;
    }

    public function getOwnerID(): ?string
    {
        return $this->ownerID;
    }

    public function setOwnerID(string $ownerID): self
    {
        $this->ownerID = $ownerID;

        return $this;
    }

    public function getSource(): ?array
    {
        return $this->source;
    }

    public function setSource(array $source): self
    {
        $this->source = $source;

        return $this;
    }

    public function getDestination(): ?array
    {
        return $this->destination;
    }

    public function setDestination(array $destination): self
    {
        $this->destination = $destination;

        return $this;
    }

    public function getDeliveryDate()
    {
        return $this->deliveryDate;
    }

    public function setDeliveryDate($deliveryDate): self
    {
        $this->deliveryDate = new \DateTime($deliveryDate);

        return $this;
    }

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(?string $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getPayment(): ?string
    {
        return $this->payment;
    }

    public function setPayment(string $payment): self
    {
        $this->payment = $payment;

        return $this;
    }

    public function getRecipientName(): ?string
    {
        return $this->recipientName;
    }

    public function setRecipientName(?string $recipientName): self
    {
        $this->recipientName = $recipientName;

        return $this;
    }

    public function getRecipientPhone(): ?string
    {
        return $this->recipientPhone;
    }

    public function setRecipientPhone(?string $recipientPhone): self
    {
        $this->recipientPhone = $recipientPhone;

        return $this;
    }

    public function getUpdateDate()
    {
        return $this->updateDate;
    }

    public function setUpdateDate($updateDate): self
    {
        $this->updateDate = new \DateTime($updateDate);

        return $this;
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

    public function getFromBranch(): ?int
    {
        return $this->fromBranch;
    }

    public function setFromBranch(string $fromBranch): self
    {
        $this->fromBranch = $fromBranch;

        return $this;
    }

    public function getUuid(): ?string
    {
        return $this->uuid;
    }

    public function setUuid(?string $uuid): self
    {
        $this->uuid = $uuid;

        return $this;
    }

    public function getKilometer(): ?int
    {
        return $this->kilometer;
    }

    public function setKilometer(?int $kilometer): self
    {
        $this->kilometer = $kilometer;

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
    
    public function getCaptainID(): ?string
    {
        return $this->captainID;
    }

    public function setCaptainID(string $captainID): self
    {
        $this->captainID = $captainID;

        return $this;
    }

    public function getClientID(): ?string
    {
        return $this->clientID;
    }

    public function setClientID(string $clientID): self
    {
        $this->clientID = $clientID;

        return $this;
    }

    public function getProductID(): ?int
    {
        return $this->productID;
    }

    public function setProductID(int $productID): self
    {
        $this->productID = $productID;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }
}
