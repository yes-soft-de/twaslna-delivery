<?php

namespace App\Repository;

use App\Entity\OrderEntity;
use App\Entity\CaptainProfileEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Entity\BranchesEntity;
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

    public function getOrderById($orderId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addSelect('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate','OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.uuid', 'OrderEntity.captainID', 'OrderEntity.createdAt')
            ->andWhere('OrderEntity.id = :id')
            ->setParameter('id', $orderId)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function orderById($orderId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addSelect('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate','OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.uuid','OrderEntity.captainID', 'OrderEntity.createdAt')
            ->andWhere('OrderEntity.id = :id')
            ->setParameter('id', $orderId)
            ->getQuery()
            ->getResult();
    }

    public function getOrdersByOwnerID($storeOwnerID)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addselect('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.captainID', 'OrderEntity.createdAt')

            ->andWhere('OrderEntity.ownerID = :storeOwnerID')
            ->andWhere("OrderEntity.state != 'cancelled'")
            ->setParameter('storeOwnerID', $storeOwnerID)

            ->getQuery()
            ->getResult();
    }

    public function orderStatus($orderId)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addselect('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.uuid', 'OrderEntity.captainID', 'OrderEntity.createdAt', 'OrderEntity.productID')

            ->andWhere('OrderEntity.id = :orderId')
            ->setParameter('orderId', $orderId)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function closestOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.uuid', 'OrderEntity.createdAt')
          
            ->andWhere("OrderEntity.state = 'pending' ")

            ->getQuery()
            ->getResult();
    }

    public function getPendingOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.createdAt')

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
            ->addSelect('OrderEntity.id as orderID', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate as orderDate', 'OrderEntity.updateDate as updateOrderDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'captainProfileEntity.captainName', 'captainProfileEntity.car', 'captainProfileEntity.drivingLicence', 'captainProfileEntity.image', 'StoreOwnerProfileEntity.storeOwnerName as ownerName', 'OrderEntity.fromBranch','captainProfileEntity.specialLink', 'OrderEntity.createdAt') 
           
            ->leftJoin(CaptainProfileEntity::class, 'captainProfileEntity', Join::WITH, 'OrderEntity.captainID = captainProfileEntity.captainID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'StoreOwnerProfileEntity', Join::WITH, 'StoreOwnerProfileEntity.storeOwnerID = OrderEntity.ownerID')

            ->andWhere("OrderEntity.state = 'ongoing' ") 
            ->getQuery()
            ->getResult();
    }

    public function getAcceptedOrderByCaptainId($captainID)
    {
        return $this->createQueryBuilder('OrderEntity')
            ->addSelect('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate as orderDate', 'OrderEntity.updateDate as updateOrderDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'userProfileEntity.storeOwnerName', 'OrderEntity.fromBranch', 'OrderEntity.createdAt') 
            ->addSelect('branchesEntity.brancheName', 'branchesEntity.location','branchesEntity.city as branchCity')
            ->leftJoin(StoreOwnerProfileEntity::class, 'userProfileEntity', Join::WITH, 'userProfileEntity.storeOwnerID = OrderEntity.ownerID')
            ->leftJoin(StoreOwnerBranchEntity::class, 'branchesEntity', Join::WITH, 'branchesEntity.id = OrderEntity.fromBranch')

            ->andWhere('OrderEntity.captainID = :captainID')
            ->andWhere("orderEntity.state != 'delivered'")
            ->setParameter('captainID', $captainID) 
            ->getQuery()
            ->getResult();
    }

    public function getRecordsForCaptain($CaptainId)
    {
        return $this->createQueryBuilder('OrderEntity')
        
            ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate as orderDate', 'OrderEntity.updateDate as updateOrderDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch','branchesEntity.location','branchesEntity.brancheName','branchesEntity.city as branchCity', 'OrderEntity.createdAt') 

            ->leftJoin(BranchesEntity::class, 'branchesEntity', Join::WITH, 'branchesEntity.id = OrderEntity.fromBranch')

            ->leftJoin(AcceptedOrderEntity::class, 'acceptedOrderEntity', Join::WITH, 'acceptedOrderEntity.orderID = OrderEntity.id')

            ->andWhere("acceptedOrderEntity.captainID = :CaptainId ")
            ->setParameter('CaptainId', $CaptainId)  
            ->getQuery()
            ->getResult();
    }

     public function getOrders()
    {
        return $this->createQueryBuilder('OrderEntity')
            ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.updateDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'userProfileEntity.storeOwnerName as storeOwnerName', 'OrderEntity.kilometer', 'OrderEntity.captainID', 'OrderEntity.createdAt')
            
            ->leftJoin(StoreOwnerProfileEntity::class, 'userProfileEntity', Join::WITH, 'userProfileEntity.storeOwnerID = OrderEntity.ownerID')

            ->getQuery()
            ->getResult();
    }

    public function countOrdersInMonthForOwner($fromDate, $toDate, $ownerId)
    {
        return $this->createQueryBuilder('OrderEntity')

            ->select('count(OrderEntity.id) as countOrdersInMonth')

            ->where('OrderEntity.createdAt >= :fromDate')
            ->andWhere('OrderEntity.createdAt < :toDate')
            ->andWhere('OrderEntity.ownerID = :ownerId')

            ->setParameter('fromDate', $fromDate)
            ->setParameter('toDate', $toDate)
            ->andWhere("OrderEntity.state != 'cancelled'")
            ->setParameter('ownerId', $ownerId)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getAllOrders($fromDate, $toDate, $ownerId)
    {
        return $this->createQueryBuilder('OrderEntity')

          ->select('OrderEntity.id', 'OrderEntity.ownerID', 'OrderEntity.source', 'OrderEntity.destination', 'OrderEntity.deliveryDate', 'OrderEntity.note', 'OrderEntity.payment', 'OrderEntity.recipientName', 'OrderEntity.recipientPhone', 'OrderEntity.state', 'OrderEntity.fromBranch', 'OrderEntity.uuid', 'userProfileEntity.storeOwnerName as userName', 'OrderEntity.captainID', 'OrderEntity.createdAt')

          ->andWhere("OrderEntity.state != 'cancelled'")
          ->where('OrderEntity.createdAt >= :fromDate')
          ->andWhere('OrderEntity.createdAt < :toDate')
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
        
          ->where('OrderEntity.createdAt >= :fromDate')
          ->andWhere('OrderEntity.createdAt < :toDate')
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

          ->select('SUBSTRING(OrderEntity.createdAt, 1, 10) as myDate', 'OrderEntity.createdAt', 'count(OrderEntity.id) as countOrdersInDay')
        
          ->andWhere('OrderEntity.ownerID = :ownerID') 
          ->andWhere("OrderEntity.state != 'cancelled'")
          ->andWhere('OrderEntity.createdAt >= :fromDate')
          ->andWhere('OrderEntity.createdAt < :toDate')

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
            ->select('count(OrderEntity.id) as countOrdersDeliverd')

            ->andWhere('OrderEntity.captainID = :captainId')
            ->andWhere("OrderEntity.state = 'delivered'")

            ->setParameter('captainId', $captainId)
            ->getQuery()
            ->getResult();
    }

    public function countOrdersInMonthForCaptain($fromDate, $toDate, $captainId)
    {
        return $this->createQueryBuilder('OrderEntity')

            ->select('count(OrderEntity.id) as countOrdersInMonth')
       

            ->where('OrderEntity.createdAt >= :fromDate')
            ->andWhere('OrderEntity.createdAt < :toDate')
            ->andWhere('OrderEntity.captainID = :captainId')

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

            ->where('OrderEntity.createdAt >= :fromDate')
            ->andWhere('OrderEntity.createdAt < :toDate')
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

          ->select('SUBSTRING(OrderEntity.createdAt, 1, 10) as myDate', 'OrderEntity.createdAt', 'count(OrderEntity.id) as countOrdersInDay')
        
          ->andWhere('OrderEntity.captainID = :captainID') 
          ->andWhere('OrderEntity.createdAt >= :fromDate')
          ->andWhere('OrderEntity.createdAt < :toDate')

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
}
