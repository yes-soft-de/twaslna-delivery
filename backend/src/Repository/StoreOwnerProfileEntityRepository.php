<?php

namespace App\Repository;

use App\Entity\StoreOwnerProfileEntity;
use App\Entity\StoreOwnerBranchEntity;
use App\Entity\OrderEntity;
use App\Entity\CaptainProfileEntity;
use App\Entity\DeliveryCompanyFinancialEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method StoreOwnerProfileEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method StoreOwnerProfileEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method StoreOwnerProfileEntity[]    findAll()
 * @method StoreOwnerProfileEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StoreOwnerProfileEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StoreOwnerProfileEntity::class);
    }

     public function getStoreOwnerProfileByID($id)
    {
        return $this->createQueryBuilder('profile')
            ->select('profile.id', 'profile.storeOwnerName', 'profile.image', 'profile.story', 'profile.free', 'profile.status', 'profile.phone', 'profile.privateOrders', 'profile.hasProducts')
            ->addSelect('DeliveryCompanyFinancialEntity.deliveryCost')

            ->leftJoin(DeliveryCompanyFinancialEntity::class, 'DeliveryCompanyFinancialEntity', Join::WITH, 'profile.id = profile.id')
            ->andWhere('profile.id = :id')

            ->setParameter('id', $id)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getStoreOwnerByCategoryId($storeCategoryId)
    {
        return $this->createQueryBuilder('profile')
            ->select('profile.id', 'profile.storeOwnerName', 'profile.image', 'profile.phone', 'profile.privateOrders', 'profile.hasProducts')
            ->addSelect('StoreOwnerBranchEntity.location')
            ->addSelect('DeliveryCompanyFinancialEntity.deliveryCost')

            ->leftJoin(DeliveryCompanyFinancialEntity::class, 'DeliveryCompanyFinancialEntity', Join::WITH, 'profile.id = profile.id')

            ->leftJoin(StoreOwnerBranchEntity::class, 'StoreOwnerBranchEntity', Join::WITH, 'StoreOwnerBranchEntity.storeOwnerProfileID = profile.id ')

            ->andWhere('profile.storeCategoryId = :storeCategoryId')

            ->setParameter('storeCategoryId', $storeCategoryId)

            ->getQuery()
            ->getResult();
    }

    public function getStoreOwnerBest()
    {
        return $this->createQueryBuilder('profile')
            ->select('profile.id', 'profile.storeOwnerName', 'profile.image', 'profile.phone')
            ->addSelect('StoreOwnerBranchEntity.location')
            ->leftJoin(StoreOwnerBranchEntity::class, 'StoreOwnerBranchEntity', Join::WITH, 'StoreOwnerBranchEntity.storeOwnerProfileID = profile.id ')

            ->andWhere('profile.is_best = 1')
            ->getQuery()
            ->getResult();
    }

    public function getUserProfile($storeOwnerID)
    {
        return $this->createQueryBuilder('profile')

            ->andWhere('profile.storeOwnerID = :storeOwnerID')
            ->setParameter('storeOwnerID', $storeOwnerID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getOwners()
    {
        return $this->createQueryBuilder('profile')

            ->select('profile.id', 'profile.storeOwnerID', 'profile.storeOwnerName', 'profile.image', 'profile.story', 'profile.free')
            ->addSelect('orderEntity.id as orderID', 'orderEntity.date', 'orderEntity.source', 'orderEntity.branchId', 'orderEntity.payment', 'orderEntity.destination','branchesEntity.location','branchesEntity.branchName','branchesEntity.city as branchCity', 'acceptedOrderEntity.captainID','captainProfileEntity.captainName')
       
            ->leftJoin(OrderEntity::class, 'orderEntity', Join::WITH, 'profile.storeOwnerID = orderEntity.ownerID')

            ->leftJoin(StoreOwnerBranchEntity::class, 'branchesEntity', Join::WITH, 'orderEntity.branchId = branchesEntity.id')

            ->leftJoin(CaptainProfileEntity::class, 'captainProfileEntity', Join::WITH, 'orderEntity.captainID = captainProfileEntity.captainID')

            ->getQuery()
            ->getResult();
    }

    public function getAllStoreOwners()
    {
        return $this->createQueryBuilder('profile')

            ->select('profile.id', 'profile.storeOwnerID', 'profile.storeOwnerName', 'profile.free', 'profile.roomID')

            ->getQuery()
            ->getResult();
    }
}
