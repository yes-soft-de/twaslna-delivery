<?php

namespace App\Response;

class OrderClosestResponse
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
    public $uuid;
    public $owner;
    public $createdAt;
    public $productID;
    public $product;
}
