<?php

namespace App\Repository;

use App\Entity\UserProfileEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method UserProfileEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method UserProfileEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method UserProfileEntity[]    findAll()
 * @method UserProfileEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UserProfileEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UserProfileEntity::class);
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
