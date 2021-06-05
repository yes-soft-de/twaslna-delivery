<?php

namespace App\Repository;

use App\Entity\StoreCategoryEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

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
}
