<?php

namespace App\Response;

class OrderResponse
{
    public $id;
    public $ownerID;
    public $storeOwnerName;
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
    public $location;
    public $brancheName;
    public $branchCity;
    public $acceptedOrder;
    public $record;
    public $completionTime;
    public $uuid;
    public $countOrdersInMonth;
    public $countOrdersInDay;
    public $owner;
    public $image;
    public $imageURL;
    public $baseURL;
    public $kilometer;
    public $rating;
    public $currentStage;
    public $createdAt;
    public $productID;
}
