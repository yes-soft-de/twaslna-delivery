<?php

namespace App\Repository;

use App\Entity\StoreCategoryEntity;
use App\Entity\StoreOwnerProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method StoreCategoryEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method StoreCategoryEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method StoreCategoryEntity[]    findAll()
 * @method StoreCategoryEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StoreCategoryEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, StoreCategoryEntity::class);
    }

    
  public function areThereItemsRelatedToThisStoreCategory($id) {
    return $this->createQueryBuilder('storeCategory')
    ->leftJoin(StoreOwnerProfileEntity::class, 'storeOwnerProfile', Join::WITH, 'storeOwnerProfile.storeCategoryId = :id')

    ->andWhere(' storeOwnerProfile.storeCategoryId = :id ')

    ->setParameter('id',$id)
    ->getQuery()
    ->getResult();
  }
}
