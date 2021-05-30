<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\StoreCategoryCreateRequest;
use App\Service\StoreCategoryService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class StoreCategoryController extends BaseController
{
    private $autoMapping;
    private $storeCategoryService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, StoreCategoryService $storeCategoryService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->storeCategoryService = $storeCategoryService;
    }
    //TODO:test and end point for get all ,get by id
    /**
     * @Route("/createstorecategory", name="createStoreCategory", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function createStoreCategory(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, StoreCategoryCreateRequest::class, (object)$data);
        $result = $this->storeCategoryService->createStoreCategory($request);

        return $this->response($result, self::CREATE);
    }
}
