<?php

namespace App\Repository;

use App\Entity\ProductEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Entity\StoreOwnerBranchEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method ProductEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ProductEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ProductEntity[]    findAll()
 * @method ProductEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ProductEntity::class);
    }

    public function getStoreOwnerProfileByUserID($userID)
    {
        return $this->createQueryBuilder('product')
            ->select('storeOwnerProfile.id')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.userID = :userID')
            ->setParameter('userID',$userID)
            ->getQuery()
            ->getResult();
    }

    public function getProductsbyStoreOwnerProfile($storeOwnerProfileID)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.userID = :storeOwnerProfileID')

            ->setParameter('storeOwnerProfileID',$storeOwnerProfileID)
            ->getQuery()
            ->getResult();
    }

    public function getProducts()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->addSelect('storeOwnerProfile.id', 'storeOwnerProfile.userName as storeOwnerName','storeOwnerProfile.userID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.branch', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.brancheName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.id')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.branch = storeOwnerBranch.id')

            ->getQuery()
            ->getResult();
    }

    public function getProductById($id)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->addSelect('storeOwnerProfile.id', 'storeOwnerProfile.userName as storeOwnerName','storeOwnerProfile.userID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.branch', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.brancheName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.id')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.branch = storeOwnerBranch.id')

            ->andWhere('product.id= :id')
            ->setParameter('id',$id)
            ->getQuery()
            ->getOneOrNullResult();
    }
}
