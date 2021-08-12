<?php

namespace App\Service;

use App\AutoMapping;
use App\Manager\CaptainPaymentManager;
use App\Entity\CaptainPaymentEntity;
use App\Request\CaptainPaymentCreateRequest;
use App\Response\CaptainPaymentCreateResponse;

class CaptainPaymentService
{
    private $autoMapping;
    private $captainPaymentManager;

    public function __construct(AutoMapping $autoMapping, CaptainPaymentManager $captainPaymentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->captainPaymentManager = $captainPaymentManager;
    }

    public function createCaptainPayment(CaptainPaymentCreateRequest $request)
    {
        $item = $this->captainPaymentManager->createCaptainPayment($request);

        return $this->autoMapping->map(CaptainPaymentEntity::class, CaptainPaymentCreateResponse::class, $item);
    }
    
    public function getCaptainPaymentsFromCompany($captainId)
    {
      return $this->captainPaymentManager->getCaptainPaymentsFromCompany($captainId);
    }
    
    public function getCaptainPaymentsToCompany($captainId)
    {
       return $this->captainPaymentManager->getCaptainPaymentsToCompany($captainId);
    }

    public function sumPaymentsFromCompany($captainId)
    {
       return $this->captainPaymentManager->sumPaymentsFromCompany($captainId);
    }

    public function sumPaymentsToCompany($captainId)
    {
       return $this->captainPaymentManager->sumPaymentsToCompany($captainId);
    }

    public function getSumPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
       return $this->captainPaymentManager->getSumPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getSumPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
       return $this->captainPaymentManager->getSumPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
       return $this->captainPaymentManager->getPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }

    public function getPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
       return $this->captainPaymentManager->getPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate);
    }
}
