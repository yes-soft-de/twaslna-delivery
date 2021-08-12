<?php

namespace App\Repository;

use App\Entity\OrderEntity;
use App\Entity\CaptainProfileEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Entity\BranchesEntity;
use App\Entity\OrderDetailEntity;
use App\Entity\ClientPaymentEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;
use App\Entity\StoreOwnerBranchEntity;

/**
 * @method OrderEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderEntity[]    findAll()
 * @method OrderEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderEntity::class);
    }
    
    public function orderById($orderId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addSelect('OrderEntity.id', 'OrderEntity.storeOwnerProfileID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updatedAt','OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.branchId', 'OrderEntity.roomID','OrderEntity.captainID', 'OrderEntity.createdAt','OrderEntity.productID')
            ->andWhere('OrderEntity.id = :id')
            ->setParameter('id', $orderId)
            ->getQuery()
            ->getResult();
    }

    public function getOrdersByOwnerID($storeOwnerID)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addselect('OrderEntity.id', 'OrderEntity.storeOwnerProfileID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updatedAt', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.branchId', 'OrderEntity.captainID', 'OrderEntity.createdAt')

            ->andWhere('OrderEntity.storeOwnerProfileID = :storeOwnerID')
            ->andWhere("OrderEntity.state != 'cancelled'")
            ->setParameter('storeOwnerID', $storeOwnerID)

            ->getQuery()
            ->getResult();
    }

    public function orderStatusByOrderId($orderId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.storeOwnerProfileID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updatedAt', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.roomID', 'OrderEntity.captainID', 'OrderEntity.createdAt', 'OrderEntity.detail','OrderEntity.deliveryCost', 'OrderEntity.orderCost', 'OrderEntity.orderType', 'OrderEntity.orderType')

            ->andWhere('OrderEntity.id = :orderId')
            ->setParameter('orderId', $orderId)
            ->getQuery()
            ->getResult();
    }

    public function closestOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.deliveryDate', 'OrderEntity.createdAt', 'OrderEntity.storeOwnerProfileID', 'OrderEntity.source', 'OrderEntity.payment', 'OrderEntity.detail', 'OrderEntity.deliveryCost', 'OrderEntity.orderCost', 'OrderEntity.orderType')
            ->addSelect('orderDetailEntity.id as orderDetailId', 'orderDetailEntity.orderNumber')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.orderID = OrderEntity.id')

            ->addGroupBy('OrderEntity.id')
            ->getQuery()
            ->getResult();
    }

    public function getPendingOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.storeOwnerProfileID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updatedAt', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.branchId', 'OrderEntity.createdAt', 'OrderEntity.productID')

            ->andWhere("OrderEntity.state = 'pending'")

            ->getQuery()
            ->getResult();
    }
    public function countAllOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('count(OrderEntity.id) as ordersCount') 
            ->andWhere("OrderEntity.state != 'cancelled'")
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function countpendingOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('count(OrderEntity.id) as countpendingOrders')

            ->andWhere("OrderEntity.state = 'pending' ")

            ->getQuery()
            ->getOneOrNullResult();
    }
    
    public function countOngoingOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('count(OrderEntity.id) as countOngoingOrders')

            ->andWhere("OrderEntity.state = 'ongoing' ") 

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function countCancelledOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('count(OrderEntity.id) as countCancelledOrders') 

            ->andWhere("OrderEntity.state = 'cancelled' ") 
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function ongoingOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addSelect('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updatedAt', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state','OrderEntity.branchId', 'OrderEntity.createdAt', 'captainProfileEntity.captainName', 'captainProfileEntity.car', 'captainProfileEntity.image', 'StoreOwnerProfileEntity.storeOwnerName','captainProfileEntity.specialLink') 
           
            ->leftJoin(CaptainProfileEntity::class, 'captainProfileEntity', Join::WITH, 'OrderEntity.captainID = captainProfileEntity.captainID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'StoreOwnerProfileEntity', Join::WITH, 'StoreOwnerProfileEntity.storeOwnerID = OrderEntity.ownerID')

            ->andWhere("OrderEntity.state = 'ongoing' ") 
            ->getQuery()
            ->getResult();
    }

    public function getAcceptedOrderByCaptainId($captainID)
    {
        return $this->createQueryBuilder('orderEntity')
            ->addSelect('orderEntity.id', 'orderEntity.storeOwnerProfileID', 'orderEntity.source', 'orderEntity.destination', 'orderEntity.deliveryDate', 'orderEntity.updatedAt', 'orderEntity.note', 'orderEntity.payment', 'orderEntity.recipientName', 'orderEntity.recipientPhone', 'orderEntity.state', 'userProfileEntity.storeOwnerName', 'orderEntity.branchId', 'orderEntity.createdAt', 'orderEntity.deliveryCost', 'orderEntity.orderCost', 'orderEntity.detail', '  orderEntity.orderType') 
            ->leftJoin(StoreOwnerProfileEntity::class, 'userProfileEntity', Join::WITH, 'userProfileEntity.id = orderEntity.storeOwnerProfileID')
            ->andWhere('orderEntity.captainID = :captainID')
            ->andWhere("orderEntity.state != 'delivered'")
            ->setParameter('captainID', $captainID) 
            ->getQuery()
            ->getResult();
    }

    public function getLogsForCaptain($CaptainId)
    {
        return $this->createQueryBuilder('OrderEntity')
        
            ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate as orderDate', 'OrderEntity.updatedAt as updateOrderDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.branchId','branchesEntity.location','branchesEntity.branchName','branchesEntity.city as branchCity', 'OrderEntity.createdAt') 

            ->leftJoin(BranchesEntity::class, 'branchesEntity', Join::WITH, 'branchesEntity.id = OrderEntity.branchId')

            ->leftJoin(AcceptedOrderEntity::class, 'acceptedOrderEntity', Join::WITH, 'acceptedOrderEntity.orderID = OrderEntity.id')

            ->andWhere("acceptedOrderEntity.captainID = :CaptainId ")
            ->setParameter('CaptainId', $CaptainId)  
            ->getQuery()
            ->getResult();
    }

     public function getOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updatedAt', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.branchId', 'userProfileEntity.storeOwnerName', 'OrderEntity.kilometer', 'OrderEntity.captainID', 'OrderEntity.createdAt', 'OrderEntity.productID')
            
            ->leftJoin(StoreOwnerProfileEntity::class, 'userProfileEntity', Join::WITH, 'userProfileEntity.storeOwnerID = OrderEntity.ownerID')

            ->getQuery()
            ->getResult();
    }

    public function countOrdersInMonthForOwner($fromDate, $toDate, $ownerId)
    {
        return $this->createQueryBuilder('OrderEntity')

            ->select('count(OrderEntity.id) as countOrdersInMonth')

            ->where('OrderEntity.deliveryDate >= :fromDate')
            ->andWhere('OrderEntity.deliveryDate < :toDate')
            ->andWhere('OrderEntity.ownerID = :ownerId')

            ->setParameter('fromDate', $fromDate)
            ->setParameter('toDate', $toDate)
            ->andWhere("OrderEntity.state != 'cancelled'")
            ->setParameter('ownerId', $ownerId)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getOrdersInMonthForOwner($fromDate, $toDate, $ownerId)
    {
        return $this->createQueryBuilder('OrderEntity')

          ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.branchId', 'OrderEntity.roomID', 'userProfileEntity.storeOwnerName as userName', 'OrderEntity.captainID', 'OrderEntity.createdAt', 'OrderEntity.productID')

          ->andWhere("OrderEntity.state != 'cancelled'")
          ->where('OrderEntity.deliveryDate >= :fromDate')
          ->andWhere('OrderEntity.deliveryDate < :toDate')
          ->andWhere('OrderEntity.ownerID = :ownerId')

          ->leftJoin(StoreOwnerProfileEntity::class, 'userProfileEntity', Join::WITH, 'userProfileEntity.storeOwnerID = :ownerId')
        
          ->setParameter('fromDate', $fromDate)
          ->setParameter('toDate', $toDate)
          ->setParameter('ownerId', $ownerId)
          ->getQuery()
          ->getResult();
       
    }

    public function getTopOwners($fromDate, $toDate)
    {
        return $this->createQueryBuilder('OrderEntity')
       // countOrdersInMonth = countOrdersForOwnerInMonth
          ->select('OrderEntity.ownerID','OrderEntity.ownerID', 'count(OrderEntity.ownerID) as countOrdersInMonth')
          ->addSelect('userProfileEntity.storeOwnerName', 'userProfileEntity.image')
          ->leftJoin(StoreOwnerProfileEntity::class, 'userProfileEntity', Join::WITH, 'userProfileEntity.storeOwnerID = OrderEntity.ownerID')
        
          ->where('OrderEntity.deliveryDate >= :fromDate')
          ->andWhere('OrderEntity.deliveryDate < :toDate')
          ->andWhere("OrderEntity.state != 'cancelled'")

          ->addGroupBy('OrderEntity.ownerID')
          
          ->addGroupBy('userProfileEntity.storeOwnerName')
          ->addGroupBy('userProfileEntity.image')

          ->having('count(OrderEntity.ownerID) > 0')
          ->setMaxResults(15)
          ->addOrderBy('countOrdersInMonth','DESC')
         
          ->setParameter('fromDate', $fromDate)
          ->setParameter('toDate', $toDate)
          ->getQuery()
          ->getResult();
    }
    
    public function countOrdersInDay($ownerID, $fromDate, $toDate)
    {
        return $this->createQueryBuilder('OrderEntity')

          ->select('SUBSTRING(OrderEntity.deliveryDate, 1, 10) as myDate', 'OrderEntity.deliveryDate', 'count(OrderEntity.id) as countOrdersInDay', 'OrderEntity.productID')
        
          ->andWhere('OrderEntity.ownerID = :ownerID') 
          ->andWhere("OrderEntity.state != 'cancelled'")
          ->andWhere('OrderEntity.deliveryDate >= :fromDate')
          ->andWhere('OrderEntity.deliveryDate < :toDate')

          ->addGroupBy('OrderEntity.ownerID')
          ->addGroupBy('myDate')
          
          ->having('count(OrderEntity.id) > 0')
       
          ->addOrderBy('countOrdersInDay','DESC')

          ->setParameter('ownerID', $ownerID)
          ->setParameter('fromDate', $fromDate)
          ->setParameter('toDate', $toDate)
          
          ->getQuery()
          ->getResult();
    }

    public function countCaptainOrdersDelivered($captainId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('count(OrderEntity.id) as countOrdersDelivered', 'sum(OrderEntity.invoiceAmount) as sumInvoiceAmount', 'sum(OrderEntity.deliveryCost) as deliveryCost' )

            ->andWhere('OrderEntity.captainID = :captainId')
            ->andWhere("OrderEntity.state = 'delivered'")

            ->setParameter('captainId', $captainId)
            ->getQuery()
            ->getResult();
    }

    public function captainOrdersDelivered($captainId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.invoiceAmount', 'OrderEntity.deliveryCost', 'OrderEntity.deliveryDate')

            ->andWhere('OrderEntity.captainID = :captainId')
            ->andWhere("OrderEntity.state = 'delivered'")

            ->setParameter('captainId', $captainId)
            ->getQuery()
            ->getResult();
    }

    public function countOrdersInMonthForCaptain($fromDate, $toDate, $captainId)
    {
        return $this->createQueryBuilder('OrderEntity')

            ->select('count(OrderEntity.id) as countOrdersInMonth', 'sum(OrderEntity.invoiceAmount) as sumInvoiceAmount', 'sum(OrderEntity.deliveryCost) as deliveryCost')
       
            ->where('OrderEntity.deliveryDate >= :fromDate')
            ->andWhere('OrderEntity.deliveryDate < :toDate')
            ->andWhere('OrderEntity.captainID = :captainId')
            ->andWhere("OrderEntity.state = 'delivered'")
            ->setParameter('fromDate', $fromDate)
            ->setParameter('toDate', $toDate)
            ->setParameter('captainId', $captainId)
            ->getQuery()
            ->getResult();
    }

    public function getAcceptedOrderByCaptainIdInMonth($fromDate, $toDate, $captainId)
    {
        return $this->createQueryBuilder('OrderEntity')

            ->select('OrderEntity.id')

            ->where('OrderEntity.deliveryDate >= :fromDate')
            ->andWhere('OrderEntity.deliveryDate < :toDate')
            ->andWhere('OrderEntity.captainID = :captainId')

            ->setParameter('fromDate', $fromDate)
            ->setParameter('toDate', $toDate)
            ->setParameter('captainId', $captainId)

            ->getQuery()
            ->getResult();
    }

    public function countCaptainOrdersInDay($captainID, $fromDate, $toDate)
    {
        return $this->createQueryBuilder('OrderEntity')

          ->select('SUBSTRING(OrderEntity.deliveryDate, 1, 10) as myDate', 'OrderEntity.deliveryDate', 'count(OrderEntity.id) as countOrdersInDay')
        
          ->andWhere('OrderEntity.captainID = :captainID') 
          ->andWhere('OrderEntity.deliveryDate >= :fromDate')
          ->andWhere('OrderEntity.deliveryDate < :toDate')

          ->addGroupBy('OrderEntity.captainID')
          ->addGroupBy('myDate')

          ->having('count(OrderEntity.captainID) > 0')
        
          ->addOrderBy('countOrdersInDay','DESC')

          ->setParameter('captainID', $captainID)
          ->setParameter('fromDate', $fromDate)
          ->setParameter('toDate', $toDate)
          
          ->getQuery()
          ->getResult(); 
    }

    public function countOrdersDeliveredInToday($captainID, $todayStart, $todayEnd)
    {
        return $this->createQueryBuilder('OrderEntity')

          ->select('count(OrderEntity.id) as countOrdersDeliveredInToday')
        
          ->andWhere('OrderEntity.captainID = :captainID') 
          ->andWhere('OrderEntity.deliveryDate >= :todayStart')
          ->andWhere('OrderEntity.deliveryDate <= :todayEnd')
          ->andWhere("OrderEntity.state = 'delivered'")
          ->setParameter('captainID', $captainID)
          ->setParameter('todayStart', $todayStart)
          ->setParameter('todayEnd', $todayEnd)
          ->getQuery()
          ->getOneOrNullResult(); 
    }

    public function getOrdersByClientID($clientID)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.deliveryDate', 'OrderEntity.state', 'OrderEntity.createdAt','OrderEntity.deliveryCost', 'OrderEntity.orderCost','OrderEntity.orderType')
            ->addSelect('orderDetailEntity.id as orderDetailId', 'orderDetailEntity.orderNumber')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.orderID = OrderEntity.id')

            ->andWhere('OrderEntity.clientID = :clientID')
            ->andWhere("OrderEntity.state != 'delivered'")
            ->andWhere("OrderEntity.state != 'cancelled'")
            ->setParameter('clientID', $clientID)
            ->addGroupBy('OrderEntity.id')
            ->getQuery()
            ->getResult();
    }

    public function getOrdersDeliveredAndCancelledByClientId($clientID)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.deliveryDate', 'OrderEntity.state', 'OrderEntity.createdAt','OrderEntity.deliveryCost', 'OrderEntity.orderCost','OrderEntity.orderType')
            ->addSelect('orderDetailEntity.id as orderDetailId', 'orderDetailEntity.orderNumber')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.orderID = OrderEntity.id')

            ->Where('OrderEntity.clientID = :clientID')
            ->andWhere("OrderEntity.state = 'delivered' or OrderEntity.state = 'cancelled'")
            ->setParameter('clientID', $clientID)
            ->addGroupBy('OrderEntity.id')
            ->getQuery()
            ->getResult();
    }
}
