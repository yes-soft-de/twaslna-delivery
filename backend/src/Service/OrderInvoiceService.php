<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderInvoiceEntity;
use App\Manager\OrderInvoiceManager;
use App\Request\OrderInvoiceCreateRequest;
use App\Response\OrderInvoiceResponse;

class OrderInvoiceService
{
    private $autoMapping;
    private $orderInvoiceManager;

    public function __construct(AutoMapping $autoMapping, OrderInvoiceManager $orderInvoiceManager)
    {
        $this->autoMapping = $autoMapping;
        $this->orderInvoiceManager = $orderInvoiceManager;
    }

    public function createOrderInvoice(OrderInvoiceCreateRequest $request)
    {        
        $result = $this->orderInvoiceManager->createOrderInvoice($request);

        return $this->autoMapping->map(OrderInvoiceEntity::class, OrderInvoiceResponse::class, $result);
    }
}