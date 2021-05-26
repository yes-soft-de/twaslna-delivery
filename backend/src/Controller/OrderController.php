<?php

namespace App\Controller;

use App\AutoMapping;
use App\Service\OrderService;
use App\Service\CaptainService;
use App\Request\OrderCreateRequest;
use App\Request\OrderUpdateRequest;
use App\Request\OrderUpdateStateByCaptainRequest;
use App\Request\DeleteRequest;
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
    private $captainService;
   

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, OrderService $orderService, CaptainService $captainService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->orderService = $orderService;
        $this->captainService = $captainService;
    }

    /**
     * @Route("order", name="createOrder", methods={"POST"})
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
      * @Route("/order/{orderId}", name="GetOrderByIDForAdmin", methods={"GET"})
      * @IsGranted("ROLE_ADMIN")
      * @param Request $request
      * @return JsonResponse
      */
    public function getOrderById($orderId)
    {
        $result = $this->orderService->getOrderById($orderId);

        return $this->response($result, self::FETCH);
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
     * @Route("/orderStatus/{orderId}", name="orderStatus", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function orderStatus($orderId)
    {
        $result = $this->orderService->orderStatus($orderId);
       
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
    //state:on way to pick order or in store or picked or ongoing or cash or deliverd
    /**
     * @Route("/orderUpdateState", name="orderUpdateStateByCaptain", methods={"PUT"})
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

        $request = $this->autoMapping->map(stdClass::class, OrderCreateRequest::class, (object)$data);
        $request->setClientID($this->getUserId());
 
        $response = $this->orderService->createClientOrder($request);

        return $this->response($response, self::CREATE);
    }
}
