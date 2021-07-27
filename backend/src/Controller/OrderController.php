<?php

namespace App\Controller;

use App\AutoMapping;
use App\Service\OrderService;
use App\Request\OrderCreateRequest;
use App\Request\OrderClientCreateRequest ;
use App\Request\OrderClientSendCreateRequest ;
use App\Request\OrderClientSpecialCreateRequest ;
use App\Request\OrderUpdateStateByCaptainRequest;
use App\Request\OrderUpdateByClientRequest;
use App\Request\OrderUpdateSpecialByClientRequest;
use App\Request\OrderUpdateSendByClientRequest;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use stdClass;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;


class OrderController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $orderService;
   
    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, OrderService $orderService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->orderService = $orderService;
    }

    /**
     * @Route("order", name="createOrderByStoreOwner", methods={"POST"})
     * @IsGranted("ROLE_OWNER")
     */
    public function createOrder(Request $request)
    {  
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderCreateRequest::class, (object)$data);
        $request->setOwnerID($this->getUserId());

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;
            return new JsonResponse($violationsString, Response::HTTP_OK);
            }

            $response = $this->orderService->createOrder($request);
      
        if (is_string($response)) {
            return $this->response($response, self::SUBSCRIBE_ERROR);
        }

        return $this->response($response, self::CREATE);
    }

     /**
      * @Route("orders", name="GetOrdersByOwnerID", methods={"GET"})
      * @IsGranted("ROLE_OWNER")
      * @return JsonResponse
      */
    public function getOrdersByOwnerID()
    {
        $result = $this->orderService->getOrdersByOwnerID($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/closestOrders",   name="GetPendingOrdersForCaptain", methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN") 
     * @return JsonResponse
     */
    public function closestOrders()
    {
        $response = $this->orderService->closestOrders($this->getUserId());
        
        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/getpendingorders", name="GetPendingOrders", methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getPendingOrders()
    {    
         $result = $this->orderService->getPendingOrders();

        return $this->response($result, self::FETCH);
    }
    
    //To accept the order AND change state
    //state:on way to pick order or in store or picked or ongoing or delivered
    /**
     * @Route("/orderUpdateState", name="orderUpdateState", methods={"PUT"})
     * @IsGranted("ROLE_CAPTAIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function orderUpdateStateByCaptain(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderUpdateStateByCaptainRequest::class, (object) $data);
        $request->setCaptainID($this->getUserId());
        $response = $this->orderService->orderUpdateStateByCaptain($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::UPDATE);
    }

    /**
     * @Route("/dashboardOrders", name="dashboardOrders",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function dashboardOrders()
    {
        $result = $this->orderService->dashboardOrders();

        return $this->response($result, self::FETCH);
    }

    /**
      * @Route("/getOrders", name="getOrdersForAdmin", methods={"GET"})
      * @IsGranted("ROLE_ADMIN")
      * @return JsonResponse
      */
      public function getOrders()
      {
          $result = $this->orderService->getOrders();
  
          return $this->response($result, self::FETCH);
      }

     /**
     * @Route("/getAllOrdersAndCount/{year}/{month}/{userId}/{userType}", name="getAllOrdersAndCountInMonthForOwner",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function getAllOrdersAndCount($year, $month, $userId, $userType)
    {
        $result = $this->orderService->getAllOrdersAndCount($year, $month, $userId, $userType);

        return $this->response($result, self::FETCH);
    }

   /**
     * @Route("/countordersandtopowner", name="getTopOwnersInThisMonthAndCountOrdersForOwnerInDay",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function getCountOrdersInDayAndTopOwnersInThisMonth()
    {
        $result = $this->orderService->getCountOrdersInDayAndTopOwnersInThisMonth();

        return $this->response($result, self::FETCH);
    }

    /**
      * @Route("/getAcceptedOrder", name="getAcceptedOrderByCaptainId", methods={"GET"})
      * @IsGranted("ROLE_CAPTAIN")
      * @return JsonResponse
      */
      public function getAcceptedOrderByCaptainId()
      {
          $result = $this->orderService->getAcceptedOrderByCaptainId($this->getUserId());
  
          return $this->response($result, self::FETCH);
      }

     /**
     * @Route("clientorder", name="createClientOrder", methods={"POST"})
     * @IsGranted("ROLE_CLIENT")
     */
    public function createClientOrder(Request $request)
    {  
        $data = json_decode($request->getContent(), true);
        $request = $this->autoMapping->map(stdClass::class, OrderClientCreateRequest::class, (object)$data);
        $request->setClientID($this->getUserId());
        $request->setProducts($data['products']);
        $response = $this->orderService->createClientOrder($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::CREATE);
    }

     /**
     * @Route("clientsendorder", name="createClientSendOrder", methods={"POST"})
     * @IsGranted("ROLE_CLIENT")
     */
    public function createClientSendOrder(Request $request)
    {  
        $data = json_decode($request->getContent(), true);
      
        $request = $this->autoMapping->map(stdClass::class, OrderClientSendCreateRequest::class, (object)$data);
        $request->setClientID($this->getUserId());
        $response = $this->orderService->createClientSendOrder($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::CREATE);
    }

     /**
     * @Route("clientSpecialOrder", name="createClientSpecialOrder", methods={"POST"})
     * @IsGranted("ROLE_CLIENT")
     */
    public function createClientSpecialOrder(Request $request)
    {  
        $data = json_decode($request->getContent(), true);
      
        $request = $this->autoMapping->map(stdClass::class, OrderClientSpecialCreateRequest::class, (object)$data);
        $request->setClientID($this->getUserId());
        $response = $this->orderService->createClientSpecialOrder($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::CREATE);
    }

    /**
      * @Route("orderstatusbyordernumber/{orderNumber}", name="getOrderStatusByOrderNumber", methods={"GET"})
      * @return JsonResponse
      */
    public function getOrderStatusByOrderNumber($orderNumber)
      {
        $result = $this->orderService->getOrderStatusByOrderNumber($orderNumber);
  
        return $this->response($result, self::FETCH);
      }

    /**
      * @Route("orderDetails/{orderNumber}", name="getOrderDetailsByOrderNumber", methods={"GET"})
      * @IsGranted("ROLE_CAPTAIN")
      * @return JsonResponse
      */
    public function getOrderDetailsByOrderNumber($orderNumber)
      {
        $result = $this->orderService->getOrderDetailsByOrderNumber($orderNumber);
  
        return $this->response($result, self::FETCH);
      }

    /**
     * @Route("/orderUpdatebyclient", name="orderUpdateByClient", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function orderUpdateByClient(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderUpdateByClientRequest::class, (object) $data);
        $request->setProducts($data['products']);
        $response = $this->orderService->orderUpdateByClient($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::UPDATE);
    }
    
    /**
     * @Route("/orderSpecialUpdateByClient", name="orderSpecialUpdateByClient", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function orderSpecialUpdateByClient(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderUpdateSpecialByClientRequest::class, (object) $data);
        $response = $this->orderService->orderSpecialUpdateByClient($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::UPDATE);
    }
    
    /**
     * @Route("/orderSendUpdateByClient", name="orderSendUpdateByClient", methods={"PUT"})
     * @param Request $request
     * @return JsonResponse
     */
    public function orderSendUpdateByClient(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderUpdateSendByClientRequest::class, (object) $data);
        $response = $this->orderService->orderSendUpdateByClient($request);
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
          }
        return $this->response($response, self::UPDATE);
    }

    /**
     * @Route("/ordercancel/{orderNumber}", name="orderCancel", methods={"PUT"})
     * @IsGranted("ROLE_CLIENT")
     * @return JsonResponse
     */
    public function orderCancel($orderNumber)
    {
        $response = $this->orderService->orderCancel($orderNumber, $this->getUserId());
        if(is_string($response)){
            return $this->response($response, self::ERROR);  
        }
        return $this->response($response, self::UPDATE);
    }   
    
    /**
      * @Route("ordersbyclientid", name="GetOrdersByClientID", methods={"GET"})
      * @IsGranted("ROLE_CLIENT")
      * @return JsonResponse
      */
      public function getOrdersByClientID()
      {
          $result = $this->orderService->getOrdersByClientID($this->getUserId());
  
          return $this->response($result, self::FETCH);
      }
}

