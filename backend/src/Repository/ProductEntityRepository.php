<?php

namespace App\Repository;

use App\Entity\ProductEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Entity\StoreOwnerBranchEntity;
use App\Entity\OrderDetailEntity;
use App\Entity\ProductCategoryEntity;
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

    public function getStoreOwnerProfileByStoreOwnerID($storeOwnerID)
    {
        return $this->createQueryBuilder('product')
            ->select('storeOwnerProfile.id')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.storeOwnerID = :storeOwnerID')
            ->setParameter('storeOwnerID',$storeOwnerID)
            ->getQuery()
            ->getResult();
    }

    public function getProductsByStoreOwnerProfile($storeOwnerProfileID)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.storeOwnerID = :storeOwnerProfileID')
            ->andWhere('product.storeOwnerProfileID =:storeOwnerProfileID')
            ->setParameter('storeOwnerProfileID',$storeOwnerProfileID)
            ->getQuery()
            ->getResult();
    }

    public function getProductsByProductCategoryId($productCategoryID)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->leftJoin(ProductCategoryEntity::class, 'productCategoryEntity', Join::WITH, 'productCategoryEntity.id = :productCategoryID')
            ->andWhere('product.ProductCategoryID =:productCategoryID')
            ->setParameter('productCategoryID',$productCategoryID)
            ->getQuery()
            ->getResult();
    }

    public function getProductsByCategoryIdAndStoreOwnerProfileId($productCategoryID, $storeOwnerProfileId)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->leftJoin(ProductCategoryEntity::class, 'productCategoryEntity', Join::WITH, 'productCategoryEntity.id = :productCategoryID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.storeOwnerID = :storeOwnerProfileId')

            ->andWhere('product.ProductCategoryID =:productCategoryID')
            ->andWhere('product.storeOwnerProfileID =:storeOwnerProfileId')

            ->setParameter('productCategoryID',$productCategoryID)
            ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
            ->getQuery()
            ->getResult();
    }

    public function getProducts()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->addSelect('storeOwnerProfile.id', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.branchId', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.id')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.branchId = storeOwnerBranch.id')

            ->getQuery()
            ->getResult();
    }

    public function getProductById($id)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->andWhere('product.id= :id')
            ->setParameter('id',$id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getProductByIdWithFullInfo($id)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->addSelect('storeOwnerProfile.id', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.id')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.storeOwnerID = storeOwnerBranch.ownerID')

            ->andWhere('product.id= :id')
            ->setParameter('id',$id)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getProductsTopWanted()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->addSelect('count(orderDetailEntity.productID) as countProduct, orderDetailEntity.productID')
            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.storeOwnerProfileID')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.storeOwnerID = storeOwnerBranch.ownerID')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.productID = product.id')

            ->andWhere('orderDetailEntity.productID = product.id')

            ->addGroupBy('orderDetailEntity.productID')
            ->having('count(orderDetailEntity.productID) > 0')
            ->setMaxResults(20)
            ->addOrderBy('countProduct','DESC')
            ->getQuery()
            ->getResult();
    }

    public function productsTopWantedOfSpecificStoreOwner($storeOwnerProfileId)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage','product.productPrice','product.storeOwnerProfileID', 'product.ProductCategoryID')

            ->addSelect('count(orderDetailEntity.productID) as countProduct, orderDetailEntity.productID')
            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = :storeOwnerProfileId')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.storeOwnerID = storeOwnerBranch.ownerID')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.productID = product.id')

            ->andWhere('orderDetailEntity.productID = product.id')
            ->andWhere('product.storeOwnerProfileID = :storeOwnerProfileId')

            ->addGroupBy('orderDetailEntity.productID')
            ->having('count(orderDetailEntity.productID) > 0')
            ->setMaxResults(20)
            ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
            ->addOrderBy('countProduct','DESC')
            ->getQuery()
            ->getResult();
    }
}
