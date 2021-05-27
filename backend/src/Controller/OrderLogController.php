<?php

namespace App\Controller;

use App\Service\OrderLogService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class OrderLogController extends BaseController
{
    private $orderlogService;

    public function __construct(SerializerInterface $serializer, OrderLogService $orderlogService)
    {
        parent::__construct($serializer);
        $this->orderlogService = $orderlogService;
    } 
    
    /**
      * @Route("/orderlog/{orderId}", name="GetRecordByOrderId", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
      public function getOrderLogByOrderId($orderId)
      {
          $result = $this->orderlogService->getOrderLogByOrderId($orderId);
  
          return $this->response($result, self::FETCH);
      }
      
    /**
      * @Route("/orderlogs/{orderId}", name="GetRecordsByOrderId", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
      public function getOrderLogsByOrderId($orderId)
      {
          $result = $this->orderlogService->getOrderLogsWithcompletionTime($orderId);
  
          return $this->response($result, self::FETCH);
      }

     /**
      * @Route("/orderlogs", name="GetLogsByUserId", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
    public function getOrderLogsByUserID()
    {    
        if( $this->isGranted('ROLE_OWNER') ) {
         $result = $this->orderlogService->getOrderLogsByStoreOwner($this->getUserId());
        }

        if( $this->isGranted('ROLE_CAPTAIN') ) {
         $result = $this->orderlogService->getOrderLogsByCaptain($this->getUserId());
        }
        
        return $this->response($result, self::FETCH);
    }

}
