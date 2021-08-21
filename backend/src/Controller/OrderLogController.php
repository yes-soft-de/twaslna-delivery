<?php

namespace App\Controller;

use App\Service\OrderLogService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class OrderLogController extends BaseController
{
    private $orderLogService;

    public function __construct(SerializerInterface $serializer, OrderLogService $orderLogService)
    {
        parent::__construct($serializer);
        $this->orderLogService = $orderLogService;
    } 
    
    /**
      * @Route("/orderlog/{orderNumber}", name="GetLogByOrderNumber", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
      //getOrderLogByOrderId
      public function getOrderLogByOrderNumber($orderNumber)
      {
          $result = $this->orderLogService->getOrderLogByOrderNumber($orderNumber);
  
          return $this->response($result, self::FETCH);
      }
      
    /**
      * @Route("/orderLogs/{orderNumber}", name="GetLogsByOrderNumber", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
      public function getOrderLogsByOrderNumber($orderNumber)
      {
          $result = $this->orderLogService->getOrderLogsWithCompletionTime($orderNumber);
  
          return $this->response($result, self::FETCH);
      }

     /**
      * @Route("/orderLogs", name="GetLogsByUserId", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
    public function getOrderLogsByUserID()
    {    
        if( $this->isGranted('ROLE_OWNER')  || $this->isGranted('ROLE_CAPTAIN')  || $this->isGranted('ROLE_CLIENT') ) {
            $result = $this->orderLogService->getOrderLogs($this->getUserId());
        }
        return $this->response($result, self::FETCH);
    }

}
