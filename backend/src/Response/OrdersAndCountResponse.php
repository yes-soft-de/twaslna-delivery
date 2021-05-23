<?php

namespace App\Response;

class OrdersAndCountResponse
{
    public $id;
    public $ownerID;
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
    public $kilometer;
    public $productID;
    public $product;
}
