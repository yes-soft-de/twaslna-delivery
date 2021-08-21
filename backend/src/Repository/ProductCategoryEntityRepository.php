<?php

namespace App\Repository;

use App\Entity\ProductCategoryEntity;
use App\Entity\ProductEntity;
use App\Entity\StoreProductCategoryEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method ProductCategoryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ProductCategoryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ProductCategoryEntity[]    findAll()
 * @method ProductCategoryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductCategoryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProductCategoryEntity::class);
    }

  public function areThereItemsRelatedToThisCategory($id) {
      
    return $this->createQueryBuilder('productCategory')
    ->leftJoin(ProductEntity::class, 'productEntity', Join::WITH, 'productEntity.ProductCategoryID = :id')

    ->leftJoin(StoreProductCategoryEntity::class, 'storeProductCategoryEntity', Join::WITH, 'storeProductCategoryEntity.productCategoryId = :id')

    ->andWhere(' productEntity.ProductCategoryID = :id ')

    ->orWhere(' storeProductCategoryEntity.productCategoryId = :id ')

    ->setParameter('id',$id)
    ->getQuery()
    ->getResult();
  }
}
