<?php


namespace App\Controller;
use App\AutoMapping;
use App\Request\OrderInvoiceCreateRequest;
use App\Service\OrderInvoiceService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class OrderInvoiceController extends BaseController
{
    private $autoMapping;
    private $orderInvoiceService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, OrderInvoiceService $orderInvoiceService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->orderInvoiceService = $orderInvoiceService;
    }
    
    /**
     * @Route("orderInvoice", name="createOrderInvoice", methods={"POST"})
     * @IsGranted("ROLE_CAPTAIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function createOrderInvoice(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, OrderInvoiceCreateRequest::class, (object)$data);

        $request->setCaptainID($this->getUserId());

        $result = $this->orderInvoiceService->createOrderInvoice($request);

        return $this->response($result, self::CREATE);
    }
}
