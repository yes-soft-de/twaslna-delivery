<?php

namespace App\Repository;

use App\Entity\OrderDetailEntity;
use App\Entity\ProductEntity;
use App\Entity\StoreProductEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method OrderDetailEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderDetailEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderDetailEntity[]    findAll()
 * @method OrderDetailEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderDetailEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderDetailEntity::class);
    }

    public function getLastOrderNumber()
    {
        return $this->createQueryBuilder('OrderDetailEntity')
            ->select('OrderDetailEntity.orderNumber','OrderDetailEntity.orderID')
            ->setMaxResults(1)
            ->addOrderBy('OrderDetailEntity.orderID','DESC')
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getOrderIdByOrderNumber($orderNumber)
    {
        return $this->createQueryBuilder('OrderDetailEntity')
            ->select('OrderDetailEntity.id','OrderDetailEntity.orderID', 'OrderDetailEntity.productID', 'OrderDetailEntity.countProduct', 'OrderDetailEntity.orderNumber')
            ->addSelect('ProductEntity.id as productID', 'ProductEntity.productName', 'ProductEntity.productImage', 'ProductEntity.ProductCategoryID')
            ->addSelect('StoreProductEntity.productPrice', 'StoreProductEntity.storeOwnerProfileID')

            ->leftJoin(ProductEntity::class, 'ProductEntity', Join::WITH, 'ProductEntity.id = OrderDetailEntity.productID')

            ->leftJoin(StoreProductEntity::class, 'StoreProductEntity', Join::WITH, 'StoreProductEntity.productID = OrderDetailEntity.productID')
            
            ->andWhere('OrderDetailEntity.orderNumber = :orderNumber')
            ->setParameter('orderNumber', $orderNumber)
            
            ->getQuery()
            ->getResult();
    }
    public function getOrderIdWithOutStoreProductByOrderNumber($orderNumber)
    {
        return $this->createQueryBuilder('OrderDetailEntity')
            ->select('OrderDetailEntity.id','OrderDetailEntity.orderID', 'OrderDetailEntity.productID', 'OrderDetailEntity.countProduct', 'OrderDetailEntity.orderNumber')
            ->addSelect('ProductEntity.id as productID', 'ProductEntity.productName', 'ProductEntity.productImage', 'ProductEntity.ProductCategoryID')

            ->leftJoin(ProductEntity::class, 'ProductEntity', Join::WITH, 'ProductEntity.id = OrderDetailEntity.productID')

            ->andWhere('OrderDetailEntity.orderNumber = :orderNumber')
            ->setParameter('orderNumber', $orderNumber)
            ->getQuery()
            ->getResult();
    }

    public function getOrderNumberByOrderId($orderID)
    {
        return $this->createQueryBuilder('OrderDetailEntity')
            ->select('OrderDetailEntity.id','OrderDetailEntity.orderID', 'OrderDetailEntity.productID', 'OrderDetailEntity.countProduct', 'OrderDetailEntity.orderNumber')
            ->addSelect('ProductEntity.id as productID', 'ProductEntity.productName', 'ProductEntity.productImage', 'ProductEntity.ProductCategoryID')
            ->addSelect('StoreProductEntity.productPrice', 'StoreProductEntity.storeOwnerProfileID')

            ->leftJoin(ProductEntity::class, 'ProductEntity', Join::WITH, 'ProductEntity.id = OrderDetailEntity.productID')

            ->leftJoin(StoreProductEntity::class, 'StoreProductEntity', Join::WITH, 'StoreProductEntity.productID = OrderDetailEntity.productID')
            
            ->andWhere('OrderDetailEntity.orderID = :orderID')
            ->setParameter('orderID', $orderID)
            ->getQuery()
            ->getResult();
    }
}
