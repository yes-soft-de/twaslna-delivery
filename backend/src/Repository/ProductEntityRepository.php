<?php

namespace App\Repository;

use App\Entity\ProductEntity;
use App\Entity\StoreProductEntity;
use App\Entity\StoreOwnerProfileEntity;
use App\Entity\StoreOwnerBranchEntity;
use App\Entity\OrderDetailEntity;
use App\Entity\ProductCategoryEntity;
use App\Entity\DeliveryCompanyFinancialEntity;
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


    public function getProductsByProductCategoryId($storeProductCategoryID)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->andWhere('product.storeProductCategoryID =:storeProductCategoryID')

            ->setParameter('storeProductCategoryID',$storeProductCategoryID)
            ->getQuery()
            ->getResult();
    }

    public function getProductsByCategoryIdAndStoreOwnerProfileId($storeProductCategoryID, $storeOwnerProfileId)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->andWhere('product.storeProductCategoryID =:storeProductCategoryID')
            ->andWhere('product.storeOwnerProfileID =:storeOwnerProfileId')

            ->setParameter('storeProductCategoryID',$storeProductCategoryID)
            ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
            ->getQuery()
            ->getResult();
    }

    public function getProducts()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->getQuery()
            ->getResult();
    }

    public function getProductByIdWithFullInfo($id)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.storeOwnerProfileID')

            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerBranch.storeOwnerProfileID = storeOwnerProfile.id ')
            
            ->andWhere('product.id= :id')
            ->setParameter('id',$id)
            ->groupBy('product.id')
            ->getQuery()
            ->getOneOrNullResult();
            // ->getResult();
    }

    public function getProductsTopWanted()
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->addSelect('count(orderDetailEntity.productID) as countProduct, orderDetailEntity.productID')

            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName', 'storeOwnerProfile.image', 'storeOwnerProfile.phone')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName')

            ->addSelect('DeliveryCompanyFinancialEntity.deliveryCost')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.productID = product.id')

            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.storeOwnerProfileID')
            
            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerBranch.storeOwnerProfileID = storeOwnerProfile.id ')

            ->leftJoin(DeliveryCompanyFinancialEntity::class, 'DeliveryCompanyFinancialEntity', Join::WITH, 'product.id = product.id')

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
             ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->addSelect('count(orderDetailEntity.productID) as countProduct, orderDetailEntity.productID')

            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName', 'storeOwnerProfile.image', 'storeOwnerProfile.phone')

            ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName')

            ->addSelect('DeliveryCompanyFinancialEntity.deliveryCost')

            ->leftJoin(OrderDetailEntity::class, 'orderDetailEntity', Join::WITH, 'orderDetailEntity.productID = product.id')
            
            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.storeOwnerProfileID')
            
            ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerBranch.storeOwnerProfileID = storeOwnerProfile.id ')

            ->leftJoin(DeliveryCompanyFinancialEntity::class, 'DeliveryCompanyFinancialEntity', Join::WITH, 'product.id = product.id')

            ->andWhere('product.storeOwnerProfileID = :storeOwnerProfileId')

            ->addGroupBy('orderDetailEntity.productID')
            ->having('count(orderDetailEntity.productID) > 0')
            ->setMaxResults(20)
            ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
            ->addOrderBy('countProduct','DESC')
            ->getQuery()
            ->getResult();
    }

    public function getProductByProductIdAndStoreOwnerProfileId($storeOwnerProfileId, $productId)
    {
        return $this->createQueryBuilder('product')
        ->select('product.id', 'product.productName', 'product.productImage', 'product.productImage', 'product.ProductCategoryID')
        ->addSelect('StoreProduct.productPrice')

        ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName','storeOwnerProfile.storeOwnerID', 'storeOwnerProfile.image', 'storeOwnerProfile.story', 'storeOwnerProfile.free', 'storeOwnerProfile.status', 'storeOwnerProfile.phone', 'storeOwnerProfile.storeOwnerID')

        ->addSelect('storeOwnerBranch.location','storeOwnerBranch.branchName','storeOwnerBranch.city')
        
        ->leftJoin(StoreProductEntity::class, 'StoreProduct', Join::WITH, 'StoreProduct.productID = :productId')

        ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = :storeOwnerProfileId')

        ->leftJoin(StoreOwnerBranchEntity::class, 'storeOwnerBranch', Join::WITH, 'storeOwnerProfile.id = storeOwnerBranch.storeOwnerProfileID')
        ->andWhere('StoreProduct.storeOwnerProfileID= :storeOwnerProfileId')
        ->andWhere('product.id = :productId')

        ->setParameter('productId',$productId)
        ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
        ->getQuery()
        ->getOneOrNullResult();
    }

    public function getStoreProductsByProfileId($storeOwnerProfileId)
    {
        return $this->createQueryBuilder('product')
        ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')
       
        ->andWhere('product.storeOwnerProfileID = :storeOwnerProfileId')
        ->setParameter('storeOwnerProfileId',$storeOwnerProfileId)
        ->getQuery()
        ->getResult();
    }

    public function areThereItemsRelatedToThisProduct($id) {
      
        return $this->createQueryBuilder('product')
        ->leftJoin(StoreProductEntity::class, 'storeProduct', Join::WITH, 'storeProduct.productID = :id')
        ->leftJoin(OrderDetailEntity::class, 'orderDetail', Join::WITH, 'orderDetail.productID = :id')

        ->andWhere(' storeProduct.productID = :id ')
        ->orWhere(' orderDetail.productID = :id ')

        ->setParameter('id',$id)
        ->getQuery()
        ->getResult();
      }

    public function countProducts()
    {
        return $this->createQueryBuilder('product')
        ->select('count(product.id) as count')
        ->getQuery()
        ->getOneOrNullResult();
    }

    public function getProductsByName($name)
    {
        return $this->createQueryBuilder('product')
            ->select('product.id', 'product.productName', 'product.productImage', 'product.productPrice', 'product.storeOwnerProfileID', 'product.storeProductCategoryID')

            ->addSelect('storeOwnerProfile.id as storeOwnerProfileID', 'storeOwnerProfile.storeOwnerName as storeOwnerName', 'storeOwnerProfile.image as storeImage')
            
            ->addSelect('DeliveryCompanyFinancialEntity.deliveryCost')
            
            ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.id = product.storeOwnerProfileID')

            ->leftJoin(DeliveryCompanyFinancialEntity::class, 'DeliveryCompanyFinancialEntity', Join::WITH, 'product.id = product.id')
           
            ->andWhere('product.productName LIKE :productName')

            ->setParameter('productName', '%'.$name.'%')

            ->setMaxResults(20)
            ->getQuery()
            ->getResult();
    }
}
