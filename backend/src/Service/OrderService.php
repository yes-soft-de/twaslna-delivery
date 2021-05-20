<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderEntity;
use App\Manager\OrderManager;
use App\Request\OrderCreateRequest;
use App\Request\OrderUpdateRequest;
use App\Request\OrderUpdateStateByCaptainRequest;
// use App\Request\SendNotificationRequest;
use App\Response\OrderCreateResponse;
use App\Response\OrderResponse;
use App\Response\DeleteResponse;
use App\Response\OrdersongoingResponse;
use App\Response\OrderByIdResponse;
use App\Response\OrdersByOwnerResponse;
use App\Response\OrderStatusResponse;
use App\Response\OrderClosestResponse;
use App\Response\OrderPendingResponse;
use App\Response\OrderUpdateStateResponse;
use App\Service\StoreOwnerSubscriptionService;
use App\Service\RatingService;
use App\Service\StoreOwnerProfileService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use App\Service\RoomIdHelperService;
use App\Service\DateFactoryService;
use App\Service\CaptainService;
use App\Service\CaptainProfileService;
use App\Service\StoreOwnerBranchService;
use App\Service\ProductService;
use App\Constant\ResponseConstant;
use App\Constant\StatusConstant;

class OrderService
{
    private $autoMapping;
    private $orderManager;
    private $logService;
    private $storeOwnerBranchService;
    private $storeOwnerSubscriptionService;
    private $storeOwnerProfileService;
    private $params;
    private $ratingService;
    // private $notificationService;
    private $roomIdHelperService;
    private $dateFactoryService;
    private $captainService;
    private $captainProfileService;
    private $productService;

    public function __construct(AutoMapping $autoMapping, OrderManager $orderManager, LogService $logService, StoreOwnerBranchService $storeOwnerBranchService, StoreOwnerSubscriptionService $storeOwnerSubscriptionService, StoreOwnerProfileService $storeOwnerProfileService, ParameterBagInterface $params,  RatingService $ratingService
                                // , NotificationService $notificationService
                               , RoomIdHelperService $roomIdHelperService,  DateFactoryService $dateFactoryService, CaptainService $captainService, CaptainProfileService $captainProfileService, ProductService $productService
                                )
    {
        $this->autoMapping = $autoMapping;
        $this->orderManager = $orderManager;
        $this->captainService = $captainService;
        $this->logService = $logService;
        $this->storeOwnerBranchService = $storeOwnerBranchService;
        $this->storeOwnerSubscriptionService = $storeOwnerSubscriptionService;
        $this->storeOwnerProfileService = $storeOwnerProfileService;
        $this->ratingService = $ratingService;
        $this->roomIdHelperService = $roomIdHelperService;
        $this->dateFactoryService = $dateFactoryService;
        $this->params = $params->get('upload_base_url') . '/';
        // $this->notificationService = $notificationService;
        $this->captainProfileService = $captainProfileService;
        $this->productService = $productService;
    }

    public function createOrder(OrderCreateRequest $request)
    {  
        $response = ResponseConstant::$PLEASE_SUBSCRIBE;
        //get Subscribe id Current
        $subscriptionCurrent =  $this->storeOwnerSubscriptionService->getSubscriptionCurrent($request->getOwnerID());
      
        if ($subscriptionCurrent) {
             // check subscription
            $status = $this->storeOwnerSubscriptionService->subscriptionIsActive($request->getOwnerID(), $subscriptionCurrent['id']);
        
            if ($status == 'active') {
                $uuid = $this->roomIdHelperService->roomIdGenerate();
                
                $item = $this->orderManager->createOrder($request, $uuid, $subscriptionCurrent['id']);

                //start-----> notification
                // try{
                // $this->notificationService->notificationToCaptain();
                //notification <------end
                // }
                // catch (\Exception $e)
                // {
        
                // }
                if ($item) {
                    $this->logService->createLog($item->getId(), $item->getState(), $request->getOwnerID());
                }
                $response =$this->autoMapping->map(OrderEntity::class, OrderCreateResponse::class, $item);
            }
            
            if ($status == StatusConstant::$INACTIVE) {
                $response = ResponseConstant::$SUBSCRIBE_IS_AWAITING_ACTIVATION;
            }
            if ($status == StatusConstant::$ORDERS_FINISHED) {
                $response = ResponseConstant::$SUBSCRIBE_AND_COUNT_ORDER_FINISHED;
            }

            if ($status == StatusConstant::$DATE_FINISHED) {
                $response = ResponseConstant::$SUBSCRIBE_AND_DATE_FINISHED;
            }

            if ($status == StatusConstant::$UNACCEPT) {
                $response = ResponseConstant::$SUBSCRIBE_UNACCEPTED;
            }
    }
        return $response;
    }

    public function getOrderById($orderId)
    {
        $acceptedOrder=[];
        $record=[];
        $order = $this->orderManager->getOrderById($orderId);
     
        if ($order){
            if ($order['fromBranch']){
                $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
                }
            if ($order['captainID'] == true) {
                $acceptedOrder = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                }
            $record = $this->logService->getFirstDate($orderId);
        }
        $response = $this->autoMapping->map('array', OrderByIdResponse::class, $order);

        if ($order) {
            $response->acceptedOrder =  $acceptedOrder;
            $response->record =  $record;
        }

        return $response;
    }

    public function getOrdersByOwnerID($userID)
    {
        $response = [];
        $orders = $this->orderManager->getOrdersByOwnerID($userID);
       
        foreach ($orders as $order) {

            if ($order['fromBranch'] == true){
                $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
            }
            
            if ($order['captainID'] == true) {
                $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                }

            if ($order['productID'] == true) {
                $order['product'] = $this->productService->getProductById($order['productID']);
                }
            $order['record'] = $this->logService->getLogByOrderId($order['id']);
            $response[] = $this->autoMapping->map('array', OrdersByOwnerResponse::class, $order);
        }

        return $response;
    }

    public function orderStatus($orderId)
    {
        $order = $this->orderManager->orderStatus($orderId);
        if ($order){
               if ($order['fromBranch'] == true) {
                    $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
               }
            
            $order['owner'] = $this->storeOwnerProfileService->getStoreOwnerProfileByStoreOwnerID($order['ownerID']);
            if ($order['captainID'] == true) {
            $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
            }
            if ($order['productID'] == true) {
                $order['product'] = $this->productService->getProductById($order['productID']);
                }
            $order['record'] = $this->logService->getLogByOrderId($orderId);
        }
        $response = $this->autoMapping->map('array', OrderStatusResponse::class, $order);

        return $response;
    }

    public function closestOrders($userId)
    {
        $response =[];
        // $status = $this->userService->captainIsActive($userId);
       
        // if ($status->getStatus() == 'active') {
            $orders = $this->orderManager->closestOrders();

            foreach ($orders as $order) {
                if ($order['fromBranch'] == true){
                    $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
                }

                if ($order['productID'] == true) {
                    $order['product'] = $this->productService->getProductById($order['productID']);
                    }

                if ($order['ownerID'] == true) {               
                    $order['owner'] = $this->storeOwnerProfileService->getStoreOwnerProfileByStoreOwnerID($order['ownerID']);
                }

                $response[] = $this->autoMapping->map('array', OrderClosestResponse::class, $order);
            }
        // }
        return $response;
    }

    public function getPendingOrders()
    {
        $response = [];

        $orders = $this->orderManager->getPendingOrders();

        foreach ($orders as $order) {

            if ($order['fromBranch']){

                $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
                }
            if ($order['productID'] == true) {
                $order['product'] = $this->productService->getProductById($order['productID']);
                }
            
            $response[] = $this->autoMapping->map('array', OrderPendingResponse::class, $order);
        }
        return $response;
    }
//remove it
    // public function update(OrderUpdateRequest $request)
    // {
    //     $item = $this->orderManager->update($request);

    //     return $this->autoMapping->map(OrderEntity::class, OrderResponse::class, $item);
    // }

    public function orderUpdateStateByCaptain(OrderUpdateStateByCaptainRequest $request)
    {
        $item = $this->orderManager->orderUpdateStateByCaptain($request);
        if($item) {        
            $this->logService->createLog($item->getId(), $request->getState(), $request->getcaptainID());
            $fromBranch = $this->storeOwnerBranchService->getBrancheById($item->getFromBranch());
            
            $product = $this->productService->getProductById($item->getProductID());
        }
        $response = $this->autoMapping->map(OrderEntity::class, OrderUpdateStateResponse::class, $item);
        if($item) {
            $response->product =  $product;
            $response->fromBranch =  $fromBranch;
        }

        //start-----> notification
        // try {
        // $notificationRequest = new SendNotificationRequest();
        // $notificationRequest->setUserIdOne($item->getOwnerID());
        // $notificationRequest->setUserIdTwo($acceptedOrder[0]['captainID']);

        // $this->notificationService->notificationOrderUpdate($notificationRequest);
        //notification <------end
        // }
        // catch (\Exception $e)
        // {

        // }
        return $response;
    }
    
    public function dashboardOrders():array
    {
        $response = [];
        $response[] = $this->orderManager->countpendingOrders();
        $response[] = $this->orderManager->countOngoingOrders();
        $response[] = $this->orderManager->countAllOrders();
        $ongoingOrders = $this->orderManager->ongoingOrders();
      
        foreach ($ongoingOrders as  $ongoingOrder) {
            
            $ongoingOrder['image'] = $this->specialLinkCheck($ongoingOrder['specialLink']).$ongoingOrder['image'];
            $ongoingOrder['image'] = $ongoingOrder['image'];
            $ongoingOrder['imageURL'] = $ongoingOrder['image'];
            
            
            if ($ongoingOrder['fromBranch']){
                $ongoingOrder['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($ongoingOrder['fromBranch']);
                }

            $response[]  = $this->autoMapping->map('array',OrdersongoingResponse::class,  $ongoingOrder);
           
        }  
        return $response;
    }

    public function getOrders()
    {
        $response = [];
        $orders = $this->orderManager->getOrders();
       
        foreach ($orders as $order) {

            if ($order['fromBranch']){
                $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
                }

            if ($order['captainID'] == true) {
                $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                    }

            $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);
        }

        return $response;
    }

     public function getAllOrdersAndCount($year, $month, $userId, $userType)
     {
        $response = [];
        $date = $this->dateFactoryService->returnRequiredDate($year, $month);

        if ($userType == "owner") {
            $response['countOrdersInMonth'] = $this->orderManager->countOrdersInMonthForOwner($date[0], $date[1], $userId);
            $response['countOrdersInDay'] = $this->orderManager->countOrdersInDay($userId, $date[0],$date[1]);

            $ordersInMonth = $this->orderManager->getAllOrders($date[0], $date[1], $userId);
            
            foreach ($ordersInMonth as $order) {

                if ($order['fromBranch']){
                    $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
                    }
    
                if ($order['captainID'] == true) {
                    $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                        }
                $order['record'] = $this->logService->getLogByOrderId($order['id']); 
                $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);
            }
        }

        if ($userType == "captain") {
        
            $response['countOrdersInMonth'] = $this->captainService->countOrdersInMonthForCaptain($date[0], $date[1], $userId);
            $response['countOrdersInDay'] = $this->captainService->countCaptainOrdersInDay($userId, $date[0],$date[1]);
            $acceptedInMonth = $this->captainService->getAcceptedOrderByCaptainIdInMonth($date[0], $date[1], $userId);
            
            foreach ($acceptedInMonth as $item){
                $ordersInMonth =  $this->orderManager->orderById($item['id']);  
            
            
                foreach ($ordersInMonth as $order) {
        
                    if ($order['fromBranch']){
                        $order['fromBranch'] = $this->storeOwnerBranchService->getBrancheById($order['fromBranch']);
                        }

                    if ($order['captainID'] == true) {
                        $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                         }
                    $order['record'] = $this->logService->getLogByOrderId($order['id']); 
                    $firstDate = $this->logService->getFirstDate($order['id']); 
                    $lastDate = $this->logService->getLastDate($order['id']);
                
                    if($firstDate[0]['date'] && $lastDate[0]['date']) {
                        $order['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']);
                        
                    }
                    
                    $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);   
                }
            }
        }
        return $response;
    }
    
    public function getTopOwners()
    {
       $response=[];
       $date = $this->dateFactoryService->returnLastMonthDate();
 
       $topOwners = $this->orderManager->getTopOwners($date[0],$date[1]);
     
        foreach ($topOwners as $topOwner) {
         
            $topOwner['imageURL'] = $topOwner['image'];
            $topOwner['image'] = $this->params.$topOwner['image'];
            $topOwner['baseURL'] = $this->params;

            $topOwner['countOrdersInDay'] = $this->orderManager->countOrdersInDay($topOwner['ownerID'], $date[0],$date[1]);
           
            $response[] = $this->autoMapping->map('array', OrderResponse::class, $topOwner);
        }
    
       return $response;
   }

   public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

    public function createClientOrder(OrderCreateRequest $request)
    {  
        $uuid = $this->roomIdHelperService->roomIdGenerate();
                
        $item = $this->orderManager->createClientOrder($request, $uuid);
        if ($item) {
            $this->logService->createLog($item->getId(), $item->getState(), $request->getClientID());
            }
        $response =$this->autoMapping->map(OrderEntity::class, OrderResponse::class, $item);
        return $response;
    }
}
