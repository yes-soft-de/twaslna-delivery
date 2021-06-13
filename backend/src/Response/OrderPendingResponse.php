<?php

namespace App\Response;

class OrderPendingResponse
{
    public $id;
    public $ownerID;
    public $source = [];
    public $destination;
    public $deliveryDate;
    public $updatedAt;
    public $note;
    public $payment;
    public $recipientName;
    public $recipientPhone;
    public $state;
    public $fromBranch;
    public $roomID;
    public $owner;
    public $createdAt;
    public $productID;
    public $product;
}
