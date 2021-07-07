<?php

namespace App\Repository;

use App\Entity\ProductEntity;
use App\Entity\StoreProductEntity;
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


    public function getProductsByProductCategoryId($productCategoryID)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.ProductCategoryID')

            ->addSelect('StoreProduct.productPrice','StoreProduct.storeOwnerProfileID')

            ->leftJoin(ProductCategoryEntity::class, 'productCategoryEntity', Join::WITH, 'productCategoryEntity.id = :productCategoryID')

            ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'StoreProduct.productID = product.id')

            ->andWhere('product.ProductCategoryID =:productCategoryID')

            ->setParameter('productCategoryID',$productCategoryID)
            ->getQuery()
            ->getResult();
    }

    public function getProductsByCategoryIdAndStoreOwnerProfileId($productCategoryID, $storeOwnerProfileId)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.ProductCategoryID')
            ->addSelect('StoreProduct.productPrice','StoreProduct.storeOwnerProfileID')

            ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'StoreProduct.productID = product.id')

            ->leftJoin(ProductCategoryEntity::class, 'productCategoryEntity', Join::WITH, 'productCategoryEntity.id = :productCategoryID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.storeOwnerID = :storeOwnerProfileId')

            ->andWhere('product.ProductCategoryID =:productCategoryID')
            ->andWhere('StoreProduct.storeOwnerProfileID =:storeOwnerProfileId')

            ->setParameter('productCategoryID',$productCategoryID)
            ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
            ->getQuery()
            ->getResult();
    }

    public function getProducts()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage', 'product.ProductCategoryID')
            ->addSelect('StoreProduct.productPrice','StoreProduct.storeOwnerProfileID')
           
            ->addSelect('storeOwnerProfile.storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'product.id = StoreProduct.productID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = StoreProduct.storeOwnerProfileID')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.id = storeOwnerBranch.ownerID')
            ->getQuery()
            ->getResult();
    }

    public function getProductByIdWithFullInfo($id)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage', 'product.ProductCategoryID')
            ->addSelect('StoreProduct.productPrice')

            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')
            
            ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'StoreProduct.productID = :id')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.id')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.storeOwnerID = storeOwnerBranch.ownerID')

            ->andWhere('product.id= :id')
            ->setParameter('id',$id)
            ->getQuery()
            // ->getOneOrNullResult();
            ->getResult();
    }

    public function getProductsTopWanted()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage', 'product.ProductCategoryID')

            ->addSelect('StoreProduct.productPrice','StoreProduct.storeOwnerProfileID')

            ->addSelect('count(orderDetailEntity.productID) as countProduct, orderDetailEntity.productID')

            ->addSelect('storeOwnerProfile.storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'product.id = StoreProduct.productID')
            
            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = StoreProduct.storeOwnerProfileID')

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
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage', 'product.ProductCategoryID')

            ->addSelect('StoreProduct.productPrice','StoreProduct.storeOwnerProfileID')

            ->addSelect('count(orderDetailEntity.productID) as countProduct, orderDetailEntity.productID')
            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'product.id = StoreProduct.productID')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = :storeOwnerProfileId')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.storeOwnerID = storeOwnerBranch.ownerID')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.productID = product.id')

            ->andWhere('orderDetailEntity.productID = product.id')
            ->andWhere('StoreProduct.storeOwnerProfileID = :storeOwnerProfileId')

            ->addGroupBy('orderDetailEntity.productID')
            ->having('count(orderDetailEntity.productID) > 0')
            ->setMaxResults(20)
            ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
            ->addOrderBy('countProduct','DESC')
            ->getQuery()
            ->getResult();
    }

    public function getPproductByProductIdAndStoreOwnerProfileId($storeOwnerProfileId, $productId)
    {
        return $this->createQueryBuilder('product')
        ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage', 'product.ProductCategoryID')
        ->addSelect('StoreProduct.productPrice')

        ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

        ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')
        
        ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'StoreProduct.productID = :productId')

        ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = :storeOwnerProfileId')

        ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.storeOwnerID = storeOwnerBranch.ownerID')

        ->andWhere('StoreProduct.storeOwnerProfileID= :storeOwnerProfileId')
        ->andWhere('product.id = :productId')

        ->setParameter('productId',$productId)
        ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
        ->getQuery()
        ->getOneOrNullResult();
        // ->getResult();
    }
}
