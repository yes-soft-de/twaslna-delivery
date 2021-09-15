<?php

namespace App\Controller;
use App\AutoMapping;
use App\Request\DeliveryCompensationAndCostDeliveryCrateRequest;
use App\Request\DeliveryCompensationAndCostDeliveryUpdateRequest;
use App\Service\DeliveryCompensationAndCostDeliveryService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;


class DeliveryCompensationAndCostDeliveryController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $deliveryCompensationAndCostDeliveryService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, DeliveryCompensationAndCostDeliveryService $deliveryCompensationAndCostDeliveryService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->deliveryCompensationAndCostDeliveryService = $deliveryCompensationAndCostDeliveryService;
    }

    /**
     * @Route("deliveryCompensationAndCostDelivery", name="createDeliveryCompensationAndCostDelivery", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function createDeliveryCompensationAndCostDelivery(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, DeliveryCompensationAndCostDeliveryCrateRequest::class, (object)$data);

        $result = $this->deliveryCompensationAndCostDeliveryService->createDeliveryCompensationAndCostDelivery($request);            

        return $this->response($result, self::CREATE);
    }
}
