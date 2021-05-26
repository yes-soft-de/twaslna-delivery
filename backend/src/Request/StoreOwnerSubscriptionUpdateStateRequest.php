<?php

namespace App\Request;

class StoreOwnerSubscriptionUpdateStateRequest
{
    private $id;

    private $status;

    private $note;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }
}
