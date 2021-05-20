<?php

namespace App\Response;

class OrderCreateResponse
{
    public $id;
    public $source = [];
    public $destination;
    public $deliveryDate;
    public $note;
    public $payment;
    public $recipientName;
    public $recipientPhone;
    public $state;
    public $uuid;
    public $createdAt;
}
