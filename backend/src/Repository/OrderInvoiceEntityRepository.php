<?php

namespace App\Repository;

use App\Entity\OrderInvoiceEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method OrderInvoiceEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderInvoiceEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderInvoiceEntity[]    findAll()
 * @method OrderInvoiceEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderInvoiceEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderInvoiceEntity::class);
    }

    // /**
    //  * @return OrderInvoiceEntity[] Returns an array of OrderInvoiceEntity objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('o')
            ->andWhere('o.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('o.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?OrderInvoiceEntity
    {
        return $this->createQueryBuilder('o')
            ->andWhere('o.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
