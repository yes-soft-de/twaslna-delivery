<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\DeliveryCompanyFinancialEntity;
use App\Entity\DeliveryCompanyFinancialCompensationEntity;
use App\Service\DeliveryCompanyFinancialCompensationService;
use App\Service\DeliveryCompanyFinancialService;
use App\Request\DeliveryCompensationAndCostDeliveryCrateRequest;
use App\Request\DeliveryCompanyFinancialRequest;
use App\Request\DeliveryCompanyFinancialCompensationCreateRequest;
use App\Response\DeliveryCompanyFinancialCompensationCreateResponse;

class DeliveryCompensationAndCostDeliveryService
{
    private $autoMapping;
    private $deliveryCompanyFinancialCompensationService;
    private $deliveryCompanyFinancialService;

    public function __construct(AutoMapping $autoMapping, DeliveryCompanyFinancialCompensationService $deliveryCompanyFinancialCompensationService, DeliveryCompanyFinancialService $deliveryCompanyFinancialService)
    {
        $this->autoMapping = $autoMapping;
        $this->deliveryCompanyFinancialService = $deliveryCompanyFinancialService;
        $this->deliveryCompanyFinancialCompensationService = $deliveryCompanyFinancialCompensationService;
    }

    public function createDeliveryCompensationAndCostDelivery(DeliveryCompensationAndCostDeliveryCrateRequest $request)
    {
        $response="";
        $arr = [];
        $deliveryCostRequest = new DeliveryCompanyFinancialRequest();
        $compensationRequest = new DeliveryCompanyFinancialCompensationCreateRequest();
        $deliveryCostRequest->setDeliveryCost($request->getDeliveryCost());
        $compensationRequest->setKilometers($request->getKilometers());
        $compensationRequest->setMaxKilometerBonus($request->getMaxKilometerBonus());
        $compensationRequest->setMinKilometerBonus($request->getMinKilometerBonus());
        
       $deliveryCost = $this->deliveryCompanyFinancialService->createDeliveryCompanyFinancial($deliveryCostRequest);
       if ($deliveryCost) {
           $compensation =
            $this->deliveryCompanyFinancialCompensationService->createFinancialCompensation($compensationRequest);
           $arr = [$deliveryCost, $compensation];
           $response = $this->autoMapping->map('array', DeliveryCompanyFinancialCompensationCreateResponse::class, $arr);
       }
    //TODO  return null
     return $response;
        
    }

    // public function updateDeliveryCompanyFinancial($request)
    // {
    //     $result = $this->deliveryCompanyFinancialManager->updateDeliveryCompanyFinancial($request);

    //     return $this->autoMapping->map(DeliveryCompanyFinancialEntity::class, DeliveryCompanyFinancialResponse::class, $result);
    // }

    // public function  getDeliveryCompanyFinancialById($id)
    // {
    //     $result = $this->deliveryCompanyFinancialManager->getDeliveryCompanyFinancialById($id);

    //     return $this->autoMapping->map(DeliveryCompanyFinancialEntity::class, DeliveryCompanyFinancialResponse::class, $result);
  
    // }

    // public function  getDeliveryCompanyFinancialAll()
    // {
    //     $response = [];
    //     $results = $this->deliveryCompanyFinancialManager->getDeliveryCompanyFinancialAll();
       
    //     foreach ($results as  $result) {
    //        $response[] = $this->autoMapping->map('array', DeliveryCompanyFinancialResponse::class, $result);
    //     }
    //     return $response;
       
    // }

    // public function  getDeliveryCost()
    // {
    //     $response = [];
    //     $results = $this->deliveryCompanyFinancialManager->getDeliveryCompanyFinancialAll();
       
    //     foreach ($results as  $result) {
    //        $response[] = $this->autoMapping->map('array', DeliveryCompanyDeliveryCostResponse::class, $result);
    //     }
    //     return $response;
       
    // }
}
