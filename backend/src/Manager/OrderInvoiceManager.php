<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderInvoiceEntity;
use App\Repository\OrderInvoiceEntityRepository;
use App\Request\OrderInvoiceCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class OrderInvoiceManager
{
    private $autoMapping;
    private $entityManager;
    private $orderInvoiceEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderInvoiceEntityRepository $orderInvoiceEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderInvoiceEntityRepository = $orderInvoiceEntityRepository;
    }

    public function createOrderInvoice(OrderInvoiceCreateRequest $request)
    {
        $entity = $this->autoMapping->map(OrderInvoiceCreateRequest::class, OrderInvoiceEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }
}
