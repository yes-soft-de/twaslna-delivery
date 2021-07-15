<?php

namespace App\Repository;

use App\Entity\OrderLogEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method OrderLogEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderLogEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderLogEntity[]    findAll()
 * @method OrderLogEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderLogEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderLogEntity::class);
    }

    public function getOrderLogByOrderNumber($orderNumber)
    {
        return $this->createQueryBuilder('OrderLogEntity')
            ->select('OrderLogEntity.id, OrderLogEntity.orderNumber, OrderLogEntity.state, OrderLogEntity.startTime')
            
            ->andWhere("OrderLogEntity.orderNumber =:orderNumber")
            ->setParameter('orderNumber', $orderNumber)
            ->setMaxResults(1)
            ->addOrderBy('OrderLogEntity.id','DESC')
            ->groupBy('OrderLogEntity.id')
            ->getQuery()
            ->getResult();
    }

    public function getOrderLogsByOrderNumber($orderNumber)
    {
        return $this->createQueryBuilder('OrderLogEntity')
            ->select('OrderLogEntity.id, OrderLogEntity.orderNumber, OrderLogEntity.state, OrderLogEntity.date')
            
            ->andWhere("OrderLogEntity.orderNumber =:orderNumber")
            ->setParameter('orderNumber', $orderNumber)
            ->getQuery()
            ->getResult();
    }
    
    public function getFirstDate($orderNumber)
    {
        return $this->createQueryBuilder('OrderLogEntity')
            ->select('OrderLogEntity.id, OrderLogEntity.state, OrderLogEntity.date')
            
            ->andWhere("OrderLogEntity.orderNumber =:orderNumber")
            ->setParameter('orderNumber', $orderNumber)
            ->setMaxResults(1)
            ->addOrderBy('OrderLogEntity.id','ASC')
            ->getQuery()
            ->getResult();
    }

    public function getLastDate($orderNumber)
    {
        return $this->createQueryBuilder('OrderLogEntity')
            ->select('OrderLogEntity.id, OrderLogEntity.state, OrderLogEntity.date')
            
            ->andWhere("OrderLogEntity.orderNumber =:orderNumber")
            ->setParameter('orderNumber', $orderNumber)
            ->setMaxResults(1)
            ->addOrderBy('OrderLogEntity.id','DESC')
            ->getQuery()
            ->getResult();
    }

    public function getOrderNumberByOwnerId($ownerID)
    {
        return $this->createQueryBuilder('OrderLogEntity')
            ->select('OrderLogEntity.id, OrderLogEntity.state, OrderLogEntity.date, OrderLogEntity.userID, OrderLogEntity.orderNumber')
            ->andWhere("OrderLogEntity.userID = :ownerID ")
            ->setParameter('ownerID', $ownerID) 
            ->getQuery()
            ->getResult();
    }

    public function getOrderNumberByCaptainId($captainID)
    {
        return $this->createQueryBuilder('OrderLogEntity')
            ->select('OrderLogEntity.id, OrderLogEntity.state, OrderLogEntity.date, OrderLogEntity.userID, OrderLogEntity.orderNumber')
            ->andWhere("OrderLogEntity.userID = :captainID ")
            ->setParameter('captainID', $captainID) 
            ->getQuery()
            ->getResult();
    }
}
