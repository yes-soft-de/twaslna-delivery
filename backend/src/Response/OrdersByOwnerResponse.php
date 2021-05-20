<?php

namespace App\Response;

class OrdersByOwnerResponse
{
    public $id;
    public $source = [];
    public $destination;
    public $deliveryDate;
    public $updateDate;
    public $note;
    public $payment;
    public $recipientName;
    public $recipientPhone;
    public $state;
    public $fromBranch;
    public $acceptedOrder;
    public $record;
    public $kilometer;
    public $rating;
    public $createdAt;
    public $productID;
    public $product;
}
