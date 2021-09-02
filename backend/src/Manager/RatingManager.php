<?php

namespace App\Manager;

use App\AutoMapping;
use App\Entity\RatingEntity;
use App\Repository\RatingEntityRepository;
use App\Request\RatingCreateRequest;
use Doctrine\ORM\EntityManagerInterface;

class RatingManager
{
    private $autoMapping;
    private $entityManager;
    private $ratingRepository;

    public function __construct(AutoMapping $autoMapping, EntityManagerInterface $entityManager, RatingEntityRepository $ratingRepository)
    {
        $this->autoMapping = $autoMapping;
        $this->entityManager = $entityManager;
        $this->ratingRepository = $ratingRepository;
    }

    public function createRatingByCaptainOrClient(RatingCreateRequest $request)
    {
        if ($request->getUserType() == null) {
            $request->setUserType("not store");
        }
        $entity = $this->autoMapping->map(RatingCreateRequest::class, RatingEntity::class, $request);
       
        $this->entityManager->persist($entity);
        $this->entityManager->flush();
        $this->entityManager->clear();

        return $entity;
    }

    public function getAvgRating($itemID, $itemType)
    {
        return $this->ratingRepository->getAvgRating($itemID, $itemType);
    }

    public function getAvgOrder($orderNumber)
    {
        return $this->ratingRepository->getAvgOrder($orderNumber);
    }
}
