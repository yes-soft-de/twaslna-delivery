<?php

namespace App\Controller;

use App\AutoMapping;
use App\Service\OrderNumberService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class OrderNumberController extends BaseController
{
    private $autoMapping;
    private $orderNumberService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, OrderNumberService $orderNumberService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->orderNumberService = $orderNumberService;
    }
    
    /**
     * @Route("/createordernumber/{orderID}", name="createOrderNumber", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function createOrderNumber($orderID)
    {
        $result = $this->orderNumberService->createOrderNumber($orderID);

        return $this->response($result, self::CREATE);
    }
}
