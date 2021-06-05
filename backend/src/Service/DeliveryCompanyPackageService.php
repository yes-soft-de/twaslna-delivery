<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\PackageEntity;
use App\Manager\DeliveryCompanyPackageManager;
use App\Request\DeliveryCompanyPackageCreateRequest;
use App\Response\DeliveryCompanyPackageResponse;

class DeliveryCompanyPackageService
{
    private $autoMapping;
    private $deliveryCompanyPackageManager;

    public function __construct(AutoMapping $autoMapping, DeliveryCompanyPackageManager $deliveryCompanyPackageManager)
    {
        $this->autoMapping = $autoMapping;
        $this->deliveryCompanyPackageManager = $deliveryCompanyPackageManager;
    }

    public function createDeliveryCompanyPackage(DeliveryCompanyPackageCreateRequest $request)
    {
        $result = $this->deliveryCompanyPackageManager->createDeliveryCompanyPackage($request);

        return $this->autoMapping->map(PackageEntity::class, DeliveryCompanyPackageResponse::class, $result);
    }

    public function getCompanyPackagesActive()
    {
        $respons = [];
        $items = $this->deliveryCompanyPackageManager->getCompanyPackagesActive();

        foreach ($items as $item) {
            $respons[] = $this->autoMapping->map('array', DeliveryCompanyPackageResponse::class, $item);
        }
        return $respons;
    }

    public function getCompanyPackages()
    {
        return $this->deliveryCompanyPackageManager->getCompanyPackages();
    }

    public function getCompanyPackageById($id)
    {
        return $this->deliveryCompanyPackageManager->getCompanyPackageById($id);
    }

    public function updateDeliveryCompanyPackageState($request)
    {
        $result = $this->deliveryCompanyPackageManager->updateDeliveryCompanyPackageState($request);

        return $this->autoMapping->map(PackageEntity::class, DeliveryCompanyPackageResponse::class, $result);
    }
}
