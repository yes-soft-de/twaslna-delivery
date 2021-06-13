<?php

namespace App\Response;

class OrderUpdateStateResponse
{
    public $id;
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
