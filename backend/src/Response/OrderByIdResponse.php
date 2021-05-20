<?php

namespace App\Response;

class OrderByIdResponse
{
    public $id;
    public $ownerID;//remove in future
    public $storeOwnerName; //fix this from repository
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
    public $uuid;
    public $kilometer;
    public $rating;
    public $createdAt;
}
