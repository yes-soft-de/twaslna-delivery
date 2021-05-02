<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\AppointmentEntity;
use App\Manager\AppointmentManager;
use App\Request\AppointmentCreateRequest;
use App\Response\AppointmentResponse;

class AppointmentService
{
    private $autoMapping;
    private $appointmentManager;

    public function __construct(AutoMapping $autoMapping, AppointmentManager $appointmentManager)
    {
        $this->autoMapping = $autoMapping;
        $this->appointmentManager = $appointmentManager;
    }

    public function createAppointment(AppointmentCreateRequest $request):object
    {
        $reprot = $this->appointmentManager->createAppointment($request);

        return $this->autoMapping->map(AppointmentEntity::class, AppointmentResponse::class, $reprot);
    }

    public function getAllAppointements():array
    {
        $response = [];
        $items = $this->appointmentManager->getAllAppointements();
        foreach ($items as $item) {
        $response[] =  $this->autoMapping->map('array', AppointmentResponse::class, $item);
        }
        return $response;
    }

    public function update($request):object
    {
        $result = $this->appointmentManager->update($request);

        return $this->autoMapping->map(AppointmentEntity::class, AppointmentResponse::class, $result);
    }
}
