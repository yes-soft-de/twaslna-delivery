<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\OrderEntity;
use App\Repository\OrderEntityRepository;
use App\Request\OrderCreateRequest;
use App\Request\OrderClientCreateRequest;
use App\Request\OrderClientSendCreateRequest;
use App\Request\OrderClientSpecialCreateRequest;
use App\Request\OrderUpdateByClientRequest;
use App\Request\OrderUpdateStateByCaptainRequest;
use Doctrine\ORM\EntityManagerInterface;

class OrderManager
{
    private $autoMapping;
    private $entityManager;
    private $orderEntityRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, OrderEntityRepository $orderEntityRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->orderEntityRepository = $orderEntityRepository;
    }

    public function createOrder(OrderCreateRequest $request, $roomID, $subscribeId)
    {
        $request->setRoomID($roomID);
        $request->setSubscribeId($subscribeId);
        $item = $this->autoMapping->map(OrderCreateRequest::class, OrderEntity::class, $request);

        $item->setDeliveryDate($item->getDeliveryDate());
        $item->setState('pending');
        
        $this->entityManager->persist($item);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $item;
    }
    
    public function orderById($orderId)
    {
        return $this->orderEntityRepository->orderById($orderId);
    }

    public function getOrdersByOwnerID($userID)
    {
        return $this->orderEntityRepository->getOrdersByOwnerID($userID);
    }

    public function orderStatusByOrderId($orderId)
    {
        return $this->orderEntityRepository->orderStatusByOrderId($orderId);
    }

    public function closestOrders()
    {
        return $this->orderEntityRepository->closestOrders();
    }

    public function getPendingOrders()
    {
        return $this->orderEntityRepository->getPendingOrders();
    }

    public function orderUpdateStateByCaptain(OrderUpdateStateByCaptainRequest $request)
    {
        $item = $this->orderEntityRepository->find($request->getId());
       
        if ($item) {
            $item = $this->autoMapping->mapToObject(OrderUpdateStateByCaptainRequest::class, OrderEntity::class, $request, $item);

            $item->setUpdatedAt($item->getUpdatedAt());
            
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function countAllOrders()
    {
        return $this->orderEntityRepository->countAllOrders();
    }

    public function countpendingOrders()
    {
        return $this->orderEntityRepository->countpendingOrders();
    }

    public function countOngoingOrders()
    {
        return $this->orderEntityRepository->countOngoingOrders();
    }

    public function countCancelledOrders()
    {
        return $this->orderEntityRepository->countCancelledOrders();
    }

    public function ongoingOrders()
    {
        return $this->orderEntityRepository->ongoingOrders();
    }
    
    public function getLogsForCaptain($user)
    {
        return $this->orderEntityRepository->getLogsForCaptain($user);
    }

    public function getOrders()
    {
        return $this->orderEntityRepository->getOrders();
    }

    public function countOrdersInMonthForOwner($fromDate, $toDate, $ownerId)
    {
        return $this->orderEntityRepository->countOrdersInMonthForOwner($fromDate, $toDate, $ownerId);
    }

    public function getOrdersInMonthForOwner($fromDate, $toDate, $ownerId)
    {
        return $this->orderEntityRepository->getOrdersInMonthForOwner($fromDate, $toDate, $ownerId);
    }

    public function getTopOwners($fromDate, $toDate)
    {
        return $this->orderEntityRepository->getTopOwners($fromDate, $toDate);
    }

    public function countOrdersInDay($ownerID, $fromDate, $toDate)
    {
        return $this->orderEntityRepository->countOrdersInDay($ownerID, $fromDate, $toDate);
    }

    public function getAcceptedOrderByCaptainId($captainID)
    {
        return $this->orderEntityRepository->getAcceptedOrderByCaptainId($captainID);
    }

    public function  countCaptainOrdersDelivered($captainId)
    {
        return $this->orderEntityRepository->countCaptainOrdersDelivered($captainId);
    }

    public function countOrdersInMonthForCaptain($fromDate, $toDate, $captainId)
    {
        return $this->orderEntityRepository->countOrdersInMonthForCaptain($fromDate, $toDate, $captainId);
    }

    public function getAcceptedOrderByCaptainIdInMonth($fromDate, $toDate, $captainId)
    {
        return $this->orderEntityRepository->getAcceptedOrderByCaptainIdInMonth($fromDate, $toDate, $captainId);
    }

    public function countCaptainOrdersInDay($captainID, $fromDate, $toDate)
    {
        return $this->orderEntityRepository->countCaptainOrdersInDay($captainID, $fromDate, $toDate);
    }

    public function createClientOrder(OrderClientCreateRequest $request, $roomID)
    {
        $request->setRoomID($roomID);
        $item = $this->autoMapping->map(OrderClientCreateRequest::class, OrderEntity::class, $request);

        $item->setDeliveryDate($item->getDeliveryDate());
        $item->setState('pending');
        
        $this->entityManager->persist($item);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $item;
    }

    public function createClientSendOrder(OrderClientSendCreateRequest $request, $roomID)
    {
        $request->setRoomID($roomID);
        $item = $this->autoMapping->map(OrderClientSendCreateRequest::class, OrderEntity::class, $request);

        $item->setDeliveryDate($item->getDeliveryDate());
        $item->setState('pending');
        
        $this->entityManager->persist($item);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $item;
    }

    public function createClientSpecialOrder(OrderClientSpecialCreateRequest $request, $roomID)
    {
        $request->setRoomID($roomID);
        $item = $this->autoMapping->map(OrderClientSpecialCreateRequest::class, OrderEntity::class, $request);

        $item->setDeliveryDate($item->getDeliveryDate());
        $item->setState('pending');
        
        $this->entityManager->persist($item);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $item;
    }

    public function orderUpdateByClient(OrderUpdateByClientRequest $request, $id)
    {
        $item = $this->orderEntityRepository->find($id);
        
        if ($item) {
            $item = $this->autoMapping->mapToObject(OrderUpdateByClientRequest::class, OrderEntity::class, $request, $item);
           
            $item->setDeliveryDate($request->getDeliveryDate());
            
            $this->entityManager->flush();
            $this->entityManager->clear();
        }
        return $item;
    }

    public function orderCancel($orderId)
    {
        $item = $this->orderEntityRepository->find($orderId);
        $item->setState('cancelled');

        if ($item) {
            $item = $this->autoMapping->mapToObject(OrderEntity::class, OrderEntity::class, $item, $item);
            
            $this->entityManager->flush();
            $this->entityManager->clear();

            return $item;
        }
    }

    public function getOrdersByClientID($clientID)
    {
        return $this->orderEntityRepository->getOrdersByClientID($clientID);
    }
}
