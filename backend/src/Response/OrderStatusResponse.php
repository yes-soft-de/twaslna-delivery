<?php

namespace App\Response;

class OrderStatusResponse
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
    public $branchId;
    public $acceptedOrder;
    public $log;
    public $roomID;
    public $owner;
    public $image;
    public $imageURL;
    public $baseURL;
    public $kilometer;
    public $rating;
    public $createdAt;
}
