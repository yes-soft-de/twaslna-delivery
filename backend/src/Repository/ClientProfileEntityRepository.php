<?php

namespace App\Repository;

use App\Entity\ClientProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ClientProfileEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method ClientProfileEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method ClientProfileEntity[]    findAll()
 * @method ClientProfileEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ClientProfileEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ClientProfileEntity::class);
    }

    public function getUserProfileByUserId($userID)
    {
        return $this->createQueryBuilder('userProfile')
            ->select('userProfile.id', 'userProfile.userName','userProfile.userID', 'userProfile.image', 'userProfile.phone', 'userProfile.uuid')

            ->andWhere('userProfile.userID = :userID')

            ->setParameter('userID', $userID)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getUserProfileByID($id)
    {
        return $this->createQueryBuilder('userProfile')
            ->select('userProfile.id', 'userProfile.userName','userProfile.userID', 'userProfile.image', 'userProfile.phone', 'userProfile.uuid')


            ->andWhere('userProfile.id = :id')

            ->setParameter('id', $id)

            ->getQuery()
            ->getOneOrNullResult();
    }

    public function getUsersProfile()
    {
        return $this->createQueryBuilder('userProfile')
            ->select('userProfile.id', 'userProfile.userName','userProfile.userID', 'userProfile.image', 'userProfile.phone', 'userProfile.uuid')

            ->getQuery()
            ->getResult();
    }

}
