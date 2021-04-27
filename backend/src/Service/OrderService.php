<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\OrderEntity;
use App\Manager\OrderManager;
use App\Request\OrderCreateRequest;
use App\Request\OrderUpdateRequest;
use App\Request\OrderUpdateStateByCaptainRequest;
// use App\Request\SendNotificationRequest;
use App\Response\OrderResponse;
use App\Response\DeleteResponse;
use App\Response\OrdersongoingResponse;
use App\Service\StoreOwnerSubscriptionService;
use App\Service\RatingService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use App\Service\RoomIdHelperService;
use App\Service\DateFactoryService;
use App\Service\AcceptedOrderFilterService;

class OrderService
{
    private $autoMapping;
    private $orderManager;
    private $acceptedOrderService;
    private $logService;
    private $branchesService;
    private $storeOwnerSubscriptionService;
    private $userService;
    private $params;
    private $ratingService;
    // private $notificationService;
    private $roomIdHelperService;
    private $dateFactoryService;
    private $acceptedOrderFilterService;

    public function __construct(AutoMapping $autoMapping, OrderManager $orderManager, AcceptedOrderService $acceptedOrderService,
                                LogService $logService, BranchesService $branchesService, StoreOwnerSubscriptionService $storeOwnerSubscriptionService,
                                UserService $userService, ParameterBagInterface $params,  RatingService $ratingService
                                // , NotificationService $notificationService
                               , RoomIdHelperService $roomIdHelperService, DateFactoryService $dateFactoryService, AcceptedOrderFilterService $acceptedOrderFilterService
                                )
    {
        $this->autoMapping = $autoMapping;
        $this->orderManager = $orderManager;
        $this->acceptedOrderService = $acceptedOrderService;
        $this->logService = $logService;
        $this->branchesService = $branchesService;
        $this->storeOwnerSubscriptionService = $storeOwnerSubscriptionService;
        $this->userService = $userService;
        $this->ratingService = $ratingService;
        $this->roomIdHelperService = $roomIdHelperService;
        $this->dateFactoryService = $dateFactoryService;
        $this->params = $params->get('upload_base_url') . '/';
        // $this->notificationService = $notificationService;
        $this->acceptedOrderFilterService = $acceptedOrderFilterService;
    }

    public function createOrder(OrderCreateRequest $request)
    {  
        $response = "please subscribe!!";
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
                    $this->logService->createLog($item->getId(), $item->getState());
                }
                $response =$this->autoMapping->map(OrderEntity::class, OrderResponse::class, $item);
            }
            
            if ($status == 'inactive') {
                $response ="subscribe is awaiting activation!!";
            }
            if ($status == 'orders finished') {
                $response ="subscripe finished, count orders is finished!!";
            }

            if ($status == 'date finished') {
                $response ="subscripe finished, date is finished!!";
            }

            if ($status == 'unaccept') {
                $response ="subscribe unaccept!!";
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
                $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
                }
            $acceptedOrder = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($orderId);
            $record = $this->logService->getFirstDate($orderId);
        }
        $response = $this->autoMapping->map('array', OrderResponse::class, $order);

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
                $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
            }
            $order['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($order['id']);
            $order['record'] = $this->logService->getLogByOrderId($order['id']);
            $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);
        }

        return $response;
    }

    public function orderStatus($orderId)
    {
        
        $order = $this->orderManager->orderStatus( $orderId);
        if ($order){
               if ($order['fromBranch'] == true) {
                    $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
               }
            
            $order['owner'] = $this->userService->getUserProfileByUserID($order['ownerID']);
            $order['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($orderId);

            $order['record'] = $this->logService->getLogByOrderId($orderId);
        }
        $response = $this->autoMapping->map('array', OrderResponse::class, $order);

        return $response;
    }

    public function closestOrders($userId)
    {
        // $response ="this captain inactive!!";
        // $status = $this->userService->captainIsActive($userId);
        // if ($status == 'active') {
            $response = [];
            $orders = $this->orderManager->closestOrders();

            foreach ($orders as $order) {
                if ($order['fromBranch'] == true){
                    $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
                }
                $order['record'] = $this->logService->getLogByOrderId($order['id']);
               
                $order['owner'] = $this->userService->getUserProfileByUserID($order['ownerID']);
                $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);
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

                $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
                }
            $order['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($order['id']);
          
            $order['record'] = $this->logService->getLogByOrderId($order['id']);
            
            $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);
        }
        return $response;
    }

    public function update(OrderUpdateRequest $request)
    {
        $item = $this->orderManager->update($request);

        return $this->autoMapping->map(OrderEntity::class, OrderResponse::class, $item);
    }

    public function orderUpdateStateByCaptain(OrderUpdateStateByCaptainRequest $request)
    {
        $item = $this->orderManager->orderUpdateStateByCaptain($request);
        if($item) {
            $acceptedOrderUpdateState = $this->acceptedOrderService->updateAcceptedOrderStateByCaptain($item->getId(), $request->getState());
        
            $acceptedOrder = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($item->getId());
            $record = $this->logService->getLogByOrderId($item->getId());
        }
        $response = $this->autoMapping->map(OrderEntity::class, OrderResponse::class, $item);
        if($item) {
            $response->acceptedOrder =  $acceptedOrder;
            $response->record =  $record;
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

    public function delete($result)
    {
        $result = $this->orderManager->delete($result);

        if ($result == null) {
            return null;
        }
        return  $this->autoMapping->map(OrderEntity::class, DeleteResponse::class, $result);
    }

    public function countAllOrders()
    {
        return $this->orderManager->countAllOrders();
    }
    
    public function dashboardOrders()
    {
        $response = [];
        $response[] = $this->orderManager->countpendingOrders();
        $response[] = $this->orderManager->countOngoingOrders();
        $response[] = $this->countAllOrders();
        $ongoingOrders = $this->orderManager->ongoingOrders();
      
        foreach ($ongoingOrders as  $ongoingOrder) {
            
            $ongoingOrder['image'] = $this->specialLinkCheck($ongoingOrder['specialLink']).$ongoingOrder['image'];
            $ongoingOrder['image'] = $ongoingOrder['image'];
            $ongoingOrder['imageURL'] = $ongoingOrder['image'];
            
            $ongoingOrder['drivingLicence'] = $this->specialLinkCheck($ongoingOrder['specialLink']).$ongoingOrder['drivingLicence'];
            $ongoingOrder['drivingLicence'] = $ongoingOrder['drivingLicence'];
            $ongoingOrder['drivingLicenceURL'] = $ongoingOrder['drivingLicence'];
            $ongoingOrder['baseURL'] = $this->params;
            
            if ($ongoingOrder['fromBranch']){
                $ongoingOrder['fromBranch'] = $this->branchesService->getBrancheById($ongoingOrder['fromBranch']);
                }
                
            $ongoingOrder['record'] = $this->logService->getFirstDate($ongoingOrder['orderID']);

            $response[]  = $this->autoMapping->map('array',OrdersongoingResponse::class,  $ongoingOrder);
           
        }  
        return $response;
    }

    public function getRecords($userId, $userType)
    {
        $response = [];
        if($userType == 'ROLE_OWNER') {
            $items = $this->orderManager->getRecords($userId);
        
            foreach ($items as $item) {
                
                $item['record'] = $this->logService->getLogsByOrderId($item['id']);
                $item['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($item['id']);

                $firstDate = $this->logService->getFirstDate($item['id']); 
                $lastDate = $this->logService->getLastDate($item['id']);
                $item['currentStage'] =  $lastDate;
                if($firstDate[0]['date'] && $lastDate[0]['date']) {
                    $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']); 
                }

                $response []= $this->autoMapping->map('array', OrderResponse::class, $item);
            }
        }

        if($userType == 'ROLE_CAPTAIN') {
            $items = $this->orderManager->getRecordsForCaptain($userId);
            
            foreach ($items as $item) {
                
                $item['record'] = $this->logService->getLogsByOrderId($item['id']);
                $item['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($item['id']);
               
                $item['rating'] = $this->ratingService->ratingByCaptainID($item['acceptedOrder'][0]['captainID']);
               
                $firstDate = $this->logService->getFirstDate($item['id']); 
                $lastDate = $this->logService->getLastDate($item['id']);
                $item['currentStage'] =  $lastDate;
                if($firstDate[0]['date'] && $lastDate[0]['date']) {
                    $item['completionTime'] = $this->dateFactoryService->subtractTwoDates($firstDate[0]['date'], $lastDate[0]['date']); 
                }
                $response []= $this->autoMapping->map('array', OrderResponse::class, $item);
            }
        }
        return $response;
    }

    public function getOrders()
    {
        $response = [];
        $orders = $this->orderManager->getOrders();
       
        foreach ($orders as $order) {

            if ($order['fromBranch']){
                $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
                }

            $order['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($order['id']);

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
                    $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
                    }
    
                $order['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($order['id']);
                $order['record'] = $this->logService->getLogByOrderId($order['id']); 
                $response[] = $this->autoMapping->map('array', OrderResponse::class, $order);
            }
        }

        if ($userType == "captain") {
        
            $response['countOrdersInMonth'] = $this->acceptedOrderFilterService->countOrdersInMonthForCaptin($date[0], $date[1], $userId);
            $response['countOrdersInDay'] = $this->acceptedOrderFilterService->countOrdersInDay($userId, $date[0],$date[1]);
            $acceptedInMonth = $this->acceptedOrderFilterService->getAcceptedOrderByCaptainIdInMonth($date[0], $date[1], $userId);
            
            foreach ($acceptedInMonth as $item){
                $ordersInMonth =  $this->orderManager->orderById($item['orderID']);  
            
            
                foreach ($ordersInMonth as $order) {
        
                    if ($order['fromBranch']){
                        $order['fromBranch'] = $this->branchesService->getBrancheById($order['fromBranch']);
                        }

                    $order['acceptedOrder'] = $this->acceptedOrderFilterService->getAcceptedOrderByOrderId($order['id']);
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
}
