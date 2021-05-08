<?php

namespace App\Repository;

use App\Entity\ClientPaymentEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ClientPaymentEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ClientPaymentEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ClientPaymentEntity[]    findAll()
 * @method ClientPaymentEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ClientPaymentEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ClientPaymentEntity::class);
    }

    // /**
    //  * @return ClientPaymentEntity[] Returns an array of ClientPaymentEntity objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ClientPaymentEntity
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
