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

    public function getCaptainPaymentsFromCompany($captainId)
    {
        return $this->captainPaymentEntityRepository->getCaptainPaymentsFromCompany($captainId);
    }

    public function getCaptainPaymentsToCompany($captainId)
    {
        return $this->captainPaymentEntityRepository->getCaptainPaymentsToCompany($captainId);
    }

    public function sumPaymentsFromCompany($captainId)
    {
        return $this->captainPaymentEntityRepository->sumPaymentsFromCompany($captainId);
    }

    public function sumPaymentsToCompany($captainId)
    {
        return $this->captainPaymentEntityRepository->sumPaymentsToCompany($captainId);
    }

    public function getSumPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->captainPaymentEntityRepository->getSumPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getSumPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->captainPaymentEntityRepository->getSumPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->captainPaymentEntityRepository->getPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->captainPaymentEntityRepository->getPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }
}
