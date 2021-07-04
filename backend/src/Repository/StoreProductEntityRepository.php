<?php

namespace App\Repository;

use App\Entity\StoreProductEntity;
use App\Entity\ProductEntity;
use App\Entity\StoreOwnerProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method StoreProductEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method StoreProductEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method StoreProductEntity[]    findAll()
 * @method StoreProductEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StoreProductEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StoreProductEntity::class);
    }

    public function getStoreOwnerProfileByStoreOwnerID($storeOwnerID)
    {
        return $this->createQueryBuilder('StoreProduct')
            ->select('storeOwnerProfile.id')

            ->join(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.storeOwnerID = :storeOwnerID')
            ->andWhere('storeOwnerProfile.storeOwnerID = :storeOwnerID')
            ->setParameter('storeOwnerID',$storeOwnerID)
            ->setMaxResults(1)
            ->getQuery()
            ->getOneOrNullResult();
    }

    
    public function storeProductsByStoreOwnerProfileId($storeOwnerProfileID)
    {
        return $this->createQueryBuilder('storeProduct')
            ->select('storeProduct.id','storeProduct.productPrice')

            ->addSelect('ProductEntity.id as productID', 'ProductEntity.productName', 'ProductEntity.productImage', 'ProductEntity.ProductCategoryID')

            ->addSelect('storeOwnerProfile.id as storeOwnerProfileId', 'storeOwnerProfile.storeOwnerName', 'storeOwnerProfile.image as storeOwnerImage','storeOwnerProfile.storeCategoryId', 'storeOwnerProfile.phone', 'storeOwnerProfile.is_best')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = :storeOwnerProfileID')

            ->leftJoin(ProductEntity::class, 'ProductEntity', Join::WITH, 'ProductEntity.id = storeProduct.productID')

            ->andWhere('storeProduct.storeOwnerProfileID = :storeOwnerProfileID')

            ->setParameter('storeOwnerProfileID',$storeOwnerProfileID)

            ->getQuery()
            ->getResult();
    }
}
