<?php

namespace App\Repository;

use App\Entity\StoreProductCategoryEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\ProductEntity;
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
        //Returns categories that contain products If you want to return all categories related to a store, delete ProductEntity
        return $this->createQueryBuilder('storeProductCategory')
            ->select("storeProductCategory.productCategoryId")
            ->addSelect("productCategoryEntity.id", "productCategoryEntity.ProductCategoryName")

            ->leftJoin(ProductCategoryEntity::class, 'productCategoryEntity', Join::WITH, 'productCategoryEntity.id = storeProductCategory.productCategoryId')

            ->leftJoin(ProductEntity::class, 'productEntity', Join::WITH, 'productEntity.storeOwnerProfileID = :storeOwnerProfileId')

            ->andWhere('storeProductCategory.storeOwnerProfileId = :storeOwnerProfileId')
            ->andWhere('productEntity.ProductCategoryID = storeProductCategory.productCategoryId')
            ->setParameter('storeOwnerProfileId', $storeOwnerProfileId)
            ->addGroupBy('productCategoryEntity.id')
            ->getQuery()
            ->getResult()
        ;
    }
}
