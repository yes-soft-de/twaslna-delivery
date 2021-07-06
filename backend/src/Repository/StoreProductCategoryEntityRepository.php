<?php

namespace App\Repository;

use App\Entity\StoreProductCategoryEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ProductEntity;
use App\Entity\StoreProductEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method StoreProductCategoryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method StoreProductCategoryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method StoreProductCategoryEntity[]    findAll()
 * @method StoreProductCategoryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StoreProductCategoryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StoreProductCategoryEntity::class);
    }

  
    public function getStoreProductsCategoryForStoreSpecific($storeOwnerProfileId)
    {
        return $this->createQueryBuilder('storeProductCategory')
            ->select("storeProductCategory.productCategoryId")
            ->addSelect("productCategoryEntity.id", "productCategoryEntity.ProductCategoryName")

            ->leftJoin(ProductCategoryEntity::class, 'productCategoryEntity', Join::WITH, 'productCategoryEntity.id = storeProductCategory.productCategoryId')

            ->leftJoin(ProductEntity::class, 'productEntity', Join::WITH, 'productEntity.ProductCategoryID = storeProductCategory.productCategoryId')

            ->leftJoin(StoreProductEntity::class, 'storeProductEntity', Join::WITH, 'storeProductEntity.storeOwnerProfileID = :storeOwnerProfileId')

            ->andWhere('storeProductCategory.storeOwnerProfileId = :storeOwnerProfileId')
            ->andWhere('storeProductEntity.productID = productEntity.id')
            
            ->setParameter('storeOwnerProfileId', $storeOwnerProfileId)
            ->addGroupBy('productCategoryEntity.id')
            ->getQuery()
            ->getResult()
        ;
    }
}
