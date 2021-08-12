<?php

namespace App\Repository;

use App\Entity\CaptainPaymentEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CaptainPaymentEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method CaptainPaymentEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method CaptainPaymentEntity[]    findAll()
 * @method CaptainPaymentEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CaptainPaymentEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CaptainPaymentEntity::class);
    }

    public function  getCaptainPaymentsFromCompany($captainId)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('PaymentsCaptain.id, PaymentsCaptain.captainId, PaymentsCaptain.amount, PaymentsCaptain.date')

               ->andWhere('PaymentsCaptain.captainId = :captainId')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 1 ")
               
               ->setParameter('captainId', $captainId)

               ->getQuery()
               ->getResult();
    }
    

    public function  getCaptainPaymentsToCompany($captainId)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('PaymentsCaptain.id, PaymentsCaptain.captainId, PaymentsCaptain.amount, PaymentsCaptain.date')

               ->andWhere('PaymentsCaptain.captainId = :captainId')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 0 ")

               ->setParameter('captainId', $captainId)

               ->getQuery()
               ->getResult();
    }
    
    public function sumPaymentsFromCompany($captainId)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('sum(PaymentsCaptain.amount) as sumPaymentsFromCompany')
               ->andWhere('PaymentsCaptain.captainId = :captainId')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 1 ")
               ->setParameter('captainId', $captainId)

               ->getQuery()
               ->getResult();
    }
    
    public function sumPaymentsToCompany($captainId)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('sum(PaymentsCaptain.amount) as sumPaymentsToCompany')
               ->andWhere('PaymentsCaptain.captainId = :captainId')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 0 ")
               ->setParameter('captainId', $captainId)

               ->getQuery()
               ->getResult();
    }

    public function getSumPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('sum(PaymentsCaptain.amount) as sumPayments ')

               ->where('PaymentsCaptain.captainId = :captainId')
               ->andWhere('PaymentsCaptain.date >= :fromDate')
               ->andWhere('PaymentsCaptain.date < :toDate')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 1 ")
               
               ->setParameter('captainId', $captainId)
               ->setParameter('fromDate', $fromDate)
               ->setParameter('toDate', $toDate)
               ->getQuery()
               ->getResult();
    }

    public function getSumPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('sum(PaymentsCaptain.amount) as sumPayments ')

               ->where('PaymentsCaptain.captainId = :captainId')
               ->andWhere('PaymentsCaptain.date >= :fromDate')
               ->andWhere('PaymentsCaptain.date < :toDate')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 0 ")

               ->setParameter('captainId', $captainId)
               ->setParameter('fromDate', $fromDate)
               ->setParameter('toDate', $toDate)
               ->getQuery()
               ->getResult();
    }

    public function getPaymentsFromCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('PaymentsCaptain.id, PaymentsCaptain.captainId, PaymentsCaptain.amount, PaymentsCaptain.date')

               ->where('PaymentsCaptain.captainId = :captainId')
               ->andWhere('PaymentsCaptain.date >= :fromDate')
               ->andWhere('PaymentsCaptain.date < :toDate')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 1 ")
               ->setParameter('captainId', $captainId)
               ->setParameter('fromDate', $fromDate)
               ->setParameter('toDate', $toDate)
               ->getQuery()
               ->getResult();
    }

    public function getPaymentsToCompanyInSpecificDate($captainId, $fromDate, $toDate)
    {
        return $this->createQueryBuilder('PaymentsCaptain')
               ->select('PaymentsCaptain.id, PaymentsCaptain.captainId, PaymentsCaptain.amount, PaymentsCaptain.date')

               ->where('PaymentsCaptain.captainId = :captainId')
               ->andWhere('PaymentsCaptain.date >= :fromDate')
               ->andWhere('PaymentsCaptain.date < :toDate')
               ->andWhere("PaymentsCaptain.paymentFromCompany = 0 ")
               ->setParameter('captainId', $captainId)
               ->setParameter('fromDate', $fromDate)
               ->setParameter('toDate', $toDate)
               ->getQuery()
               ->getResult();
    }
}
