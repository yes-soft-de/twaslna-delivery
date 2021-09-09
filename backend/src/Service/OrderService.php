<?php

namespace App\Service;

use App\AutoMapping;
use App\Constant\NotificationLocalConstant;
use App\Entity\OrderEntity;
use App\Manager\OrderManager;
use App\Request\OrderCreateRequest;
use App\Request\OrderClientCreateRequest;
use App\Request\OrderClientSendCreateRequest;
use App\Request\OrderClientSpecialCreateRequest;
use App\Request\OrderUpdateStateByCaptainRequest;
use App\Request\OrderUpdateInvoiceByCaptainRequest;
use App\Request\OrderUpdateByClientRequest;
use App\Request\OrderUpdateSpecialByClientRequest;
use App\Request\OrderUpdateSendByClientRequest;
use App\Request\SendNotificationRequest;
use App\Request\OrderDetailUpdateByClientRequest;
use App\Response\OrderCreateResponse;
use App\Response\OrderResponse;
use App\Response\OrdersongoingResponse;
use App\Response\OrderByIdResponse;
use App\Response\OrdersByOwnerResponse;
use App\Response\OrderClosestResponse;
use App\Response\OrderPendingResponse;
use App\Response\OrderUpdateStateResponse;
use App\Response\OrdersResponse;
use App\Response\OrderUpdateInvoiceByCaptainResponse;
use App\Response\OrderCreateClientResponse;
use App\Response\OrderClientSendCreateResponse;
use App\Response\AcceptedOrderResponse;
use App\Response\OrdersAndTopOwnerResponse;
use App\Response\OrdersAndCountResponse;
use App\Response\CountReportResponse;
use App\Response\OrdersByClientResponse;
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
use App\Service\OrderDetailService;
use App\Service\DeliveryCompanyFinancialService;
use App\Service\ClientProfileService;
use App\Service\NotificationLocalService;
use App\Constant\ResponseConstant;
use App\Constant\SubscribeStatusConstant;
use DateTime;

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
    private $orderDetailService;
    private $deliveryCompanyFinancialService;
    private $userService;
    private $clientProfileService;
    private $notificationLocalService;

    public function __construct(AutoMapping $autoMapping, OrderManager $orderManager, OrderLogService $orderLogService, StoreOwnerBranchService $storeOwnerBranchService, StoreOwnerSubscriptionService $storeOwnerSubscriptionService, StoreOwnerProfileService $storeOwnerProfileService, ParameterBagInterface $params,  RatingService $ratingService
                                // , NotificationService $notificationService
                               , RoomIdHelperService $roomIdHelperService,  DateFactoryService $dateFactoryService, CaptainService $captainService, CaptainProfileService $captainProfileService, ProductService $productService, OrderDetailService $orderDetailService, DeliveryCompanyFinancialService $deliveryCompanyFinancialService,
                               ClientProfileService $clientProfileService, NotificationLocalService $notificationLocalService
                                )
    {
        $this->autoMapping = $autoMapping;
        $this->orderManager = $orderManager;
        $this->captainService = $captainService;
        $this->orderLogService = $orderLogService;
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
        $this->orderDetailService = $orderDetailService;
        $this->deliveryCompanyFinancialService = $deliveryCompanyFinancialService;
        $this->clientProfileService = $clientProfileService;
        $this->notificationLocalService = $notificationLocalService;
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
                $roomID = $this->roomIdHelperService->roomIdGenerate();
                
                $item = $this->orderManager->createOrder($request, $roomID, $subscriptionCurrent['id']);

                //start-----> notification
                // try{
                // $this->notificationService->notificationToCaptain();
                //notification <------end
                // }
                // catch (\Exception $e)
                // {
        
                // }
                if ($item) {
                    $this->orderLogService->createOrderLog($item->getId(), $item->getState(), $request->getOwnerID());
                }
                $response =$this->autoMapping->map(OrderEntity::class, OrderCreateResponse::class, $item);
            }
            
            if ($status == SubscribeStatusConstant::$INACTIVE) {
                $response = ResponseConstant::$SUBSCRIBE_IS_AWAITING_ACTIVATION;
            }
            if ($status == SubscribeStatusConstant::$ORDERS_FINISHED) {
                $response = ResponseConstant::$SUBSCRIBE_AND_COUNT_ORDER_FINISHED;
            }

            if ($status == SubscribeStatusConstant::$DATE_FINISHED) {
                $response = ResponseConstant::$SUBSCRIBE_AND_DATE_FINISHED;
            }

            if ($status == SubscribeStatusConstant::$UNACCEPT) {
                $response = ResponseConstant::$SUBSCRIBE_UNACCEPTED;
            }
    }
        return $response;
    }

    public function getOrdersByOwnerID($userID)
    {
        $response = [];
        $orders = $this->orderManager->getOrdersByOwnerID($userID);
       
        foreach ($orders as $order) {

            if ($order['branchId'] == true){
                $order['branchId'] = $this->storeOwnerBranchService->getBrancheById($order['branchId']);
            }
            
            if ($order['captainID'] == true) {
                $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                }

            if ($order['productID'] == true) {
                $order['product'] = $this->productService->getProductById($order['productID']);
                }
            $order['log'] = $this->orderLogService->getOrderLogByOrderId($order['id']);
            $response[] = $this->autoMapping->map('array', OrdersByOwnerResponse::class, $order);
        }

        return $response;
    }

    public function closestOrders($userId)
    {
        $response =[];
         $status = $this->captainProfileService->captainIsActive($userId);

        if ($status  == 'inactive') {
            $response = "inactive";
        }
         if ($status  == 'active') {
            $orders = $this->orderManager->closestOrders();

            foreach ($orders as $order) {
                if ($order['storeOwnerProfileID'] == true) {  
                    $order['storeOwner'] = $this->storeOwnerProfileService->getStoreOwnerProfileById($order['storeOwnerProfileID']);
                    if( $order['storeOwner'] != null ){
                        $order['storeOwnerName']=$order['storeOwner']->storeOwnerName;
                        $order['image']=$order['storeOwner']->image;
                        $order['branches']=$order['storeOwner']->branches;
                    }
                }
                $response[] = $this->autoMapping->map('array', OrderClosestResponse::class, $order);
            }
         }
        return $response;
    }
    

    public function getPendingOrders():?array
    {
        $response = [];

        $orders = $this->orderManager->getPendingOrders();

        foreach ($orders as $order) {
            if ($order['storeOwnerProfileID'] == true) {  
                $order['storeOwner'] = $this->storeOwnerProfileService->getStoreOwnerProfileById($order['storeOwnerProfileID']);
                if( $order['storeOwner'] != null ){
                    $order['storeOwnerName']=$order['storeOwner']->storeOwnerName;
                    $order['image']=$order['storeOwner']->image;
                    $order['branches']=$order['storeOwner']->branches;
                }
            }
            $response[] = $this->autoMapping->map('array', OrderPendingResponse::class, $order);
        }
        return $response;
    }
    
    public function orderUpdateStateByCaptain(OrderUpdateStateByCaptainRequest $request)
    {
        $response = "Not updated!!";
        $orderDetails = $this->orderDetailService->getOrderIdByOrderNumber($request->getOrderNumber());
        if($orderDetails){
            $request->setId($orderDetails[0]->orderID);
            $item = $this->orderManager->orderUpdateStateByCaptain($request);

            $this->orderLogService->createOrderLog($request->getOrderNumber(), $item->getState(), $request->getCaptainID());
            //create notification local
            $state ="";
            if ($request->getState() == "on way to pick order"){
                $state = NotificationLocalConstant::$STATE_ON_WAY_PICK_ORDER;
            }
            if ($request->getState() == "in store"){
                $state =  NotificationLocalConstant::$STATE_IN_STORE;
            }
            if ($request->getState() == "ongoing"){
                $state =  NotificationLocalConstant::$STATE_ONGOING;
            }
            if ($request->getState() == "delivered"){
                $state =  NotificationLocalConstant::$STATE_DELIVERED;
            }
            $this->notificationLocalService->createNotificationLocal($item->getClientID(),  NotificationLocalConstant::$STATE_TITLE, $state, $request->getOrderNumber());

            $response = $this->autoMapping->map(OrderEntity::class, OrderUpdateStateResponse::class, $item);
        
        //start-----> notification
        //
        // $notificationRequest = new SendNotificationRequest();
        // $notificationRequest->setUserIdOne($item->getOwnerID());
        // $notificationRequest->setOrderID($item->getId());
        // $this->notificationService->notificationOrderUpdate($notificationRequest);
        //notification <------end
        //
       }
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
            
            
            if ($ongoingOrder['branchId']){
                $ongoingOrder['branchId'] = $this->storeOwnerBranchService->getBrancheById($ongoingOrder['branchId']);
                }

            $response[]  = $this->autoMapping->map('array',OrdersongoingResponse::class,  $ongoingOrder);
           
        }  
        return $response;
    }

    public function getOrders():?array
    {
        $response = [];
        $orders = $this->orderManager->getOrders();
        foreach ($orders as $order) {
            if ($order['storeOwnerProfileID'] == true) {  
                $order['storeOwner'] = $this->storeOwnerProfileService->getStoreOwnerProfileById($order['storeOwnerProfileID']);
                if( $order['storeOwner'] != null ){
                    $order['storeOwnerName']=$order['storeOwner']->storeOwnerName;
                    $order['image']=$order['storeOwner']->image;
                    $order['branches']=$order['storeOwner']->branches;
                }
            }
            $response[] = $this->autoMapping->map('array', OrderClosestResponse::class, $order);
        }
       

        return $response;
    }

     public function getAllOrdersAndCount($year, $month, $userId, $userType):?array
     {
        $response = [];
        $date = $this->dateFactoryService->returnRequiredDate($year, $month);

        if ($userType == "owner") {
            $response['countOrdersInMonth'] = $this->orderManager->countOrdersInMonthForOwner($date[0], $date[1], $userId);
            $response['countOrdersInDay'] = $this->orderManager->countOrdersInDay($userId, $date[0],$date[1]);
            
            $ordersInMonth = $this->orderManager->getOrdersInMonthForOwner($date[0], $date[1], $userId);
            
            foreach ($ordersInMonth as $order) {

                if ($order['branchId']){
                    $order['branchId'] = $this->storeOwnerBranchService->getBrancheById($order['branchId']);
                    }
    
                if ($order['captainID'] == true) {
                    $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                        }
                if ($order['productID'] == true) {
                    $order['product'] = $this->productService->getProductById($order['productID']);
                        } 
                $response[] = $this->autoMapping->map('array', OrdersAndCountResponse::class, $order);
            }
        }

        if ($userType == "captain") {
        
            $response['countOrdersInMonth'] = $this->captainService->countOrdersInMonthForCaptain($date[0], $date[1], $userId);
            $response['countOrdersInDay'] = $this->captainService->countCaptainOrdersInDay($userId, $date[0],$date[1]);
            $acceptedInMonth = $this->captainService->getAcceptedOrderByCaptainIdInMonth($date[0], $date[1], $userId);
            
            foreach ($acceptedInMonth as $item){
                $ordersInMonth =  $this->orderManager->orderById($item['id']);  
            
            
                foreach ($ordersInMonth as $order) {
        
                    if ($order['branchId']){
                        $order['branchId'] = $this->storeOwnerBranchService->getBrancheById($order['branchId']);
                        }

                    if ($order['captainID'] == true) {
                        $order['acceptedOrder'] = $this->captainProfileService->getCaptainProfileByCaptainID($order['captainID']);
                        }
                    $order['log'] = $this->orderLogService->getOrderLogByOrderId($order['id']); 
                    $firstDate = $this->orderLogService->getFirstDate($order['id']); 
                    $lastDate = $this->orderLogService->getLastDate($order['id']);
                
                    if($firstDate[0]['date'] && $lastDate[0]['date']) {
                        $order['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']);
                        
                    }

                    if ($order['productID'] == true) {
                        $order['product'] = $this->productService->getProductById($order['productID']);
                       }
                    $response[] = $this->autoMapping->map('array', OrdersAndCountResponse::class, $order);   
                }
            }
        }
        return $response;
    }

    public function getCountOrdersInDayAndTopOwnersInThisMonth():?array
    {
       $response=[];
       $date = $this->dateFactoryService->returnLastMonthDate();
 
       $topOwners = $this->orderManager->getTopOwners($date[0],$date[1]);
     
        foreach ($topOwners as $topOwner) {
         
            $topOwner['imageURL'] = $topOwner['image'];
            $topOwner['image'] = $this->params.$topOwner['image'];
            $topOwner['baseURL'] = $this->params;

            $topOwner['countOrdersInDay'] = $this->orderManager->countOrdersInDay($topOwner['storeOwnerProfileID'], $date[0],$date[1]);
           
            $response[] = $this->autoMapping->map('array', OrdersAndTopOwnerResponse::class, $topOwner);
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

    public function getAcceptedOrderByCaptainId($captainID):array
    {
        $response = [];
        $orders = $this->orderManager->getAcceptedOrderByCaptainId($captainID);
   
        foreach ($orders as $order){
          $order['orderDetail'] = $this->orderDetailService->getOrderNumberByOrderId($order['id']);
          $order['orderNumber'] = $order['orderDetail'][0]->orderNumber;
          $response[] = $this->autoMapping->map('array', AcceptedOrderResponse::class, $order);
        }
    
        return $response;
    }

    public function createClientOrder(OrderClientCreateRequest $request)
    {  
        $response = "Not created!!";
        $orderNumber = 1;
        $lastOrderNumber = $this->orderDetailService->getLastOrderNumber();
        if ($lastOrderNumber) {
            $orderNumber = $lastOrderNumber['orderNumber'] + 1;
       }
        $roomID = $this->roomIdHelperService->roomIdGenerate();
        $item = $this->orderManager->createClientOrder($request, $roomID);
        if ($item) {
            $products = $request->getProducts();
            foreach ($products as $product) {
               $productID = $product['productID'];
               $countProduct = $product['countProduct'];
               $orderDetail = $this->orderDetailService->createOrderDetail($item->getId(), $productID, $countProduct, $orderNumber);
            }
            //create log
            $this->orderLogService->createOrderLog($orderNumber, $item->getState(), $request->getClientID());
            //create notification local
            $this->notificationLocalService->createNotificationLocal($request->getClientID(), NotificationLocalConstant::$NEW_ORDER_TITLE, NotificationLocalConstant::$CREATE_ORDER_SUCCESS, $orderNumber);
            $response = $this->autoMapping->map(OrderEntity::class, OrderCreateClientResponse::class, $item);
            $response->orderDetail = $orderDetail; 
          }            
        return $response;
    }

    public function createClientSendOrder(OrderClientSendCreateRequest $request)
    {  
        $response = "Not created!!";
        $orderNumber = 1;
        $lastOrderNumber = $this->orderDetailService->getLastOrderNumber();
        if ($lastOrderNumber) {
            $orderNumber = $lastOrderNumber['orderNumber'] + 1;
       }
        $roomID = $this->roomIdHelperService->roomIdGenerate();
        $item = $this->orderManager->createClientSendOrder($request, $roomID);
        if ($item) {
            $orderDetail = $this->orderDetailService->createOrderDetail($item->getId(), null, null, $orderNumber);
            //create log
            $this->orderLogService->createOrderLog($orderNumber, $item->getState(), $request->getClientID());
            //create notification local
            $this->notificationLocalService->createNotificationLocal($request->getClientID(), NotificationLocalConstant::$NEW_ORDER_TITLE, NotificationLocalConstant::$CREATE_ORDER_SUCCESS, $orderNumber);
            $response = $this->autoMapping->map(OrderEntity::class, OrderClientSendCreateResponse::class, $item);
            $response->orderDetail['orderNumber'] = $orderDetail->orderNumber;
            $response->orderDetail['orderDetailId'] = $orderDetail->id;
          }
        return $response;
    }

    public function createClientSpecialOrder(OrderClientSpecialCreateRequest $request)
    {  
        $response = "Not created!!";
        $orderNumber = 1;
        $lastOrderNumber = $this->orderDetailService->getLastOrderNumber();
        if ($lastOrderNumber) {
            $orderNumber = $lastOrderNumber['orderNumber'] + 1;
       }
        $roomID = $this->roomIdHelperService->roomIdGenerate();
        $item = $this->orderManager->createClientSpecialOrder($request, $roomID);
        if ($item) {
            $orderDetail = $this->orderDetailService->createOrderDetail($item->getId(), null, null, $orderNumber);
            //create log
            $this->orderLogService->createOrderLog($orderNumber, $item->getState(), $request->getClientID());
            //create notification local
            $this->notificationLocalService->createNotificationLocal($request->getClientID(), NotificationLocalConstant::$NEW_ORDER_TITLE, NotificationLocalConstant::$CREATE_ORDER_SUCCESS, $orderNumber);
            $response = $this->autoMapping->map(OrderEntity::class, OrderClientSendCreateResponse::class, $item);
            $response->orderDetail['orderNumber'] = $orderDetail->orderNumber;
            $response->orderDetail['orderDetailId'] = $orderDetail->id;
          }
          
        return $response;
    }

    public function getOrderStatusByOrderNumber($orderNumber) 
    {
        $response = [];
        $orderDetails = $this->orderDetailService->getOrderIdByOrderNumber($orderNumber);
        
        if($orderDetails) {
        $order = $this->orderManager->orderStatusByOrderId($orderDetails[0]->orderID);
        
        if ($order[0]['storeOwnerProfileID']) {
            if($orderDetails[0]->storeOwnerProfileID){
                $storeOwner = $this->storeOwnerProfileService->getStoreOwnerProfileById($orderDetails[0]->storeOwnerProfileID);
           
                $response['orderDetails'] = $orderDetails;
                $response['storeOwner'] = $storeOwner;
            }
        }
        $response['order'] = $order[0];
    }
        return $response;
    }

    public function getOrderDetailsByOrderNumber($orderNumber) 
    {
        $response = [];
        $orderDetails = $this->orderDetailService->getOrderIdByOrderNumber($orderNumber);
        $deliveryCost = $this->deliveryCompanyFinancialService->getDeliveryCost();
        $rate = $this->ratingService->getAvgOrder($orderNumber);
        if($orderDetails) {
            $order = $this->orderManager->orderStatusByOrderId($orderDetails[0]->orderID);
            if ($order[0]['storeOwnerProfileID']) {
                    $storeOwner = $this->storeOwnerProfileService->getStoreOwnerProfileById($order[0]['storeOwnerProfileID']);
                    if($orderDetails[0]->storeOwnerProfileID){
                        $response['orderDetails'] = $orderDetails;
                    }
                    $response['storeOwner'] = $storeOwner;
            }
            $response['deliveryCost'] = $deliveryCost;
            $response['order'] = $order[0];
            $response['invoice']['invoiceAmount'] = $order[0]['invoiceAmount'];
            $response['invoice']['invoiceImage'] = $order[0]['invoiceImage'];
            $response['rating'] = $rate;
    }
        return $response;
    }

    public function orderUpdateByClient(OrderUpdateByClientRequest $request, $clientID)
    {
        $response = "Not updated!!";
        $orderDetails = $this->orderDetailService->getOrderIdWithOutStoreProductByOrderNumber($request->getOrderNumber());
        if($orderDetails) {
            $order = $this->orderManager->orderStatusByOrderId($orderDetails[0]->getOrderID());
            if($order[0]['state'] == 'in store') {
                //notification local
                $this->notificationLocalService->createNotificationLocal($clientID, NotificationLocalConstant::$UPDATE_ORDER_TITLE, NotificationLocalConstant::$UPDATE_ORDER_ERROR_CAPTAIN_IN_STORE, $request->getOrderNumber());
                return $response = "you can't edit, captain in the store.";
            }
                $orderUpdate = $this->orderManager->orderUpdateByClient($request, $orderDetails[0]->getOrderID());
                if($orderUpdate) {
                    foreach ($orderDetails as $orderDetail) {
                    $orderDetailDelete = $this->orderDetailService->orderDetailDelete($orderDetail->getId());
                    }

                    if ($orderDetailDelete == "Deleted") {
                        $products = $request->getProducts();
                        foreach ($products as $product) {
                            $productID = $product['productID'];
                            $countProduct = $product['countProduct'];
                            $createOrderDetail = $this->orderDetailService->createOrderDetail($orderDetails[0]->getOrderID(), $productID, $countProduct, $request->getOrderNumber());
                        }
                        //notification local
                        $this->notificationLocalService->createNotificationLocal($clientID, NotificationLocalConstant::$UPDATE_ORDER_TITLE, NotificationLocalConstant::$UPDATE_ORDER_SUCCESS, $request->getOrderNumber());
                    return $response = $this->getOrderStatusByOrderNumber($request->getOrderNumber());  
                    } 
                }     
        }       
        return $response;
    }

    public function orderSpecialUpdateByClient(OrderUpdateSpecialByClientRequest $request, $userID)
    {
        $response = "Not updated!!";
        $orderDetails = $this->orderDetailService->getOrderIdWithOutStoreProductByOrderNumber($request->getOrderNumber());
        if($orderDetails) {
            $order = $this->orderManager->orderStatusByOrderId($orderDetails[0]->getOrderID());
            if($order[0]['state'] == 'in store') {
                //notification local
                $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$UPDATE_ORDER_TITLE, NotificationLocalConstant::$UPDATE_ORDER_ERROR_CAPTAIN_IN_STORE, $request->getOrderNumber());
                return $response = "you can't edit, captain in the store.";
            }
                $orderUpdate = $this->orderManager->orderSpecialUpdateByClient($request, $orderDetails[0]->getOrderID());
                if($orderUpdate) {
                    foreach ($orderDetails as $orderDetail) {
                    $orderDetailDelete = $this->orderDetailService->orderDetailDelete($orderDetail->getId());
                    }

                    if ($orderDetailDelete == "Deleted") {
                        $createOrderDetail = $this->orderDetailService->createOrderDetail($orderDetails[0]->getOrderID(), null, null, $request->getOrderNumber());
                        //notification local
                        $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$UPDATE_ORDER_TITLE, NotificationLocalConstant::$UPDATE_ORDER_SUCCESS, $request->getOrderNumber());
                        return $response = $this->getOrderStatusByOrderNumber($request->getOrderNumber());  
                    } 
                }     
        }       
        return $response;
    }

    public function orderSendUpdateByClient(OrderUpdateSendByClientRequest $request, $userID)
    {
        $response = "Not updated!!";
        $orderDetails = $this->orderDetailService->getOrderIdWithOutStoreProductByOrderNumber($request->getOrderNumber());
        if($orderDetails) {
            $order = $this->orderManager->orderStatusByOrderId($orderDetails[0]->getOrderID());
            if($order[0]['state'] == 'in store') {
                //notification local
                $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$UPDATE_ORDER_TITLE, NotificationLocalConstant::$UPDATE_ORDER_ERROR_CAPTAIN_IN_STORE, $request->getOrderNumber());
                return $response = "you can't edit, captain in the store.";
            }
                $orderUpdate = $this->orderManager->orderSendUpdateByClient($request, $orderDetails[0]->getOrderID());
                if($orderUpdate) {
                    foreach ($orderDetails as $orderDetail) {
                    $orderDetailDelete = $this->orderDetailService->orderDetailDelete($orderDetail->getId());
                    }

                    if ($orderDetailDelete == "Deleted") {
                        $createOrderDetail = $this->orderDetailService->createOrderDetail($orderDetails[0]->getOrderID(), null, null, $request->getOrderNumber());
                        //notification local
                        $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$UPDATE_ORDER_TITLE, NotificationLocalConstant::$UPDATE_ORDER_SUCCESS, $request->getOrderNumber());
                        return $response = $this->getOrderStatusByOrderNumber($request->getOrderNumber());  
                    } 
                }     
        }       
        return $response;
    }

    public function orderCancel($orderNumber, $userID)
    {
        $response= "order Number not found!!";
        $orderDetails = $this->orderDetailService->getOrderIdByOrderNumber($orderNumber);
        if($orderDetails) {
            $order = $this->orderManager->orderStatusByOrderId($orderDetails[0]->orderID);
     
            $halfHourLaterTime = date_modify($order[0]['createdAt'],'+30 minutes');
            $nowDate = new DateTime('now');
            
            if ( $halfHourLaterTime < $nowDate) {
                //notification local
                $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$CANCEL_ORDER_TITLE, NotificationLocalConstant::$CANCEL_ORDER_ERROR_TIME, $orderNumber);
                $response="can not remove it, Exceeded time allowed";
            }
            elseif ($order[0]['state'] == 'on way to pick order') {
                //notification local
                $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$CANCEL_ORDER_TITLE, NotificationLocalConstant::$CANCEL_ORDER_ERROR_ACCEPTED, $orderNumber);
                $response = "can not remove it, The captain received the order";
            }            
            else {
                $item = $this->orderManager->orderCancel($orderDetails[0]->orderID);
                if($item) {
                    $this->orderLogService->createOrderLog($orderNumber, $item->getState(), $userID);
                    //notification local
                    $this->notificationLocalService->createNotificationLocal($userID, NotificationLocalConstant::$CANCEL_ORDER_TITLE, NotificationLocalConstant::$CANCEL_ORDER_SUCCESS, $orderNumber);
                }
                $response = $this->autoMapping->map(OrderEntity::class, OrderResponse::class, $item);
            }
        }
        return $response;
    }

    public function getOrdersByClientID($clientID)
    {
        $response = [];
        $orders = $this->orderManager->getOrdersByClientID($clientID);
       foreach ($orders as $order) {
           $order['amount'] = $order['deliveryCost'] + $order['orderCost'];
            $response[] = $this->autoMapping->map('array', OrdersByClientResponse::class, $order);
       }

        return $response;
    }

    public function getOrdersDeliveredAndCancelledByClientId($clientID)
    {
        $response = [];
        $orders = $this->orderManager->getOrdersDeliveredAndCancelledByClientId($clientID);
       foreach ($orders as $order) {
           $order['amount'] = $order['deliveryCost'] + $order['orderCost'];
            $response[] = $this->autoMapping->map('array', OrdersByClientResponse::class, $order);
       }

        return $response;
    }

    public function orderUpdateInvoiceByCaptain(OrderUpdateInvoiceByCaptainRequest $request)
    {
        $response = "Not updated!!";
        $orderDetails = $this->orderDetailService->getOrderIdByOrderNumber($request->getOrderNumber());
        if($orderDetails){
            $request->setId($orderDetails[0]->orderID);
            $item = $this->orderManager->orderUpdateInvoiceByCaptain($request);
            
            $this->orderLogService->createOrderLog($request->getOrderNumber(), $item->getState(), $request->getCaptainID());

            $response = $this->autoMapping->map(OrderEntity::class, OrderUpdateInvoiceByCaptainResponse::class, $item);
      
       }
        return $response;
    }

    public function countReport()
    {
        $response = [];
        $item['countCompletedOrders'] = $this->orderManager->countCompletedOrders();
        $item['countOngoingOrders'] = $this->orderManager->countOngoingOrders();
        $item['countCaptains'] = $this->captainProfileService->countCaptains();
        $item['countClients'] = $this->clientProfileService->countClients();
        $item['countStores'] = $this->storeOwnerProfileService->countStores();
        $item['countProducts'] = $this->productService->countProducts();
        
        $response = $this->autoMapping->map("array", CountReportResponse::class, $item);

        return $response;
    }

}
