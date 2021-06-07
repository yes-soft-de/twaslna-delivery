<?php

namespace App\Repository;

use App\Entity\OrderNumberEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method OrderNumberEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderNumberEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderNumberEntity[]    findAll()
 * @method OrderNumberEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderNumberEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderNumberEntity::class);
    }

    public function getLastOrderNumber()
    {
        return $this->createQueryBuilder('orderNumberEntity')
            ->select('orderNumberEntity.orderNumber')
            ->setMaxResults(1)
            ->addOrderBy('orderNumberEntity.id','DESC')
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getOrderIdByOrderNumber($orderNumber)
    {
        return $this->createQueryBuilder('orderNumberEntity')
            ->select('orderNumberEntity.orderID')
            ->andWhere('orderNumberEntity.orderNumber = :orderNumber')
            ->setParameter('orderNumber', $orderNumber)
            ->getQuery()
            ->getResult();
    }
}
