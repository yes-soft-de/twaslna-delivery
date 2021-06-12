<?php

namespace App\Controller;

use App\AutoMapping;
use App\Service\OrderDetailService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class OrderDetailController extends BaseController
{
    private $autoMapping;
    private $orderDetailService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, OrderDetailService $orderDetailService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->orderDetailService = $orderDetailService;
    }
    
    // /**
    //  * @Route("/createorderDetail/{orderID}", name="createOrderDetail", methods={"POST"})
    //  * @param Request $request
    //  * @return JsonResponse
    //  */
    // public function createOrderDetail($orderID)
    // {
    //     $result = $this->orderDetailService->createOrderDetail($orderID);

    //     return $this->response($result, self::CREATE);
    // }
}
