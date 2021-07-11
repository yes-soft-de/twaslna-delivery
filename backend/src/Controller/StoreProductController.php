<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\StoreProductCreateRequest;
use App\Service\StoreProductService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;


class StoreProductController extends BaseController
{
    private $autoMapping;
    private $storeProductService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, StoreProductService $storeProductService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->storeProductService = $storeProductService;
    }
    
    /**
     * @Route("/createStoreProductByAdmin", name="createStoreProductByAdmin", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function createStoreProductByAdmin(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, StoreProductCreateRequest::class, (object)$data);
        $request->setProducts($data['products']);
        $result = $this->storeProductService->createStoreProductByAdmin($request);

        return $this->response($result, self::CREATE);
    }
    
    /**
     * @Route("/createStoreProductByStoreOwner", name="createStoreProductByStoreOwner", methods={"POST"})
     * @IsGranted("ROLE_OWNER")
     * @param Request $request
     * @return JsonResponse
     */
    public function createStoreProductByStoreOwner(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, StoreProductCreateRequest::class, (object)$data);

        $result = $this->storeProductService->createStoreProductByStoreOwner($request, $this->getUserId());
        $request->setProducts($data['products']);
        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("/storeProductsByStoreOwnerId", name="storeProductsByStoreOwnerId", methods={"GET"})
     * @IsGranted("ROLE_OWNER")
     * @param Request $request
     * @return JsonResponse
     */
    public function storeProductsByStoreOwnerId()
    {
        $result = $this->storeProductService->storeProductsByStoreOwnerId($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/storeProductsByProfileId/{storeOwnerProfileId}", name="getStoreProductsByProfileId  ", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getStoreProductsByProfileId($storeOwnerProfileId)
    {
        $result = $this->storeProductService->getStoreProductsByProfileId($storeOwnerProfileId);

        return $this->response($result, self::FETCH);
    }
}
