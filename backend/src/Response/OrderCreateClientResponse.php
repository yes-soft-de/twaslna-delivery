<?php

namespace App\Response;

class OrderCreateClientResponse
{
    public $id;
    public $source = [];
    public $destination;
    public $deliveryDate;
    public $recipientName;
    public $recipientPhone;
    public $state;
    public $branchId;
    public $roomID;
    public $orderDetail;
}
