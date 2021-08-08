<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\CaptainPaymentEntity;
use App\Repository\CaptainPaymentEntityRepository;
use App\Request\CaptainPaymentCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class CaptainPaymentManager
{
    private $autoMapping;
    private $entityManager;
    private $captainPaymentEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, CaptainPaymentEntityRepository $captainPaymentEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->captainPaymentEntityRepository = $captainPaymentEntityRepository;
    }

    public function createCaptainPayment(CaptainPaymentCreateRequest $request)
    {
        $entity = $this->autoMapping->map(CaptainPaymentCreateRequest::class, CaptainPaymentEntity::class, $request);

        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getCaptainPayments($captainId)
    {
        return $this->captainPaymentEntityRepository->getCaptainPayments($captainId);
    }

    public function getSumPayments($captainId)
    {
        return $this->captainPaymentEntityRepository->getSumPayments($captainId);
    }

    public function getSumPaymentsInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->captainPaymentEntityRepository->getSumPaymentsInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getPaymentsInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->captainPaymentEntityRepository->getPaymentsInSpecificDate($captainId, $fromDate, $toDate);
    }
}
