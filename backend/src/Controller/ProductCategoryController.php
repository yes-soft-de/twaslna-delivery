<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ProductCategoryCreateRequest;
use App\Request\ProductCategoryUpdateRequest;
use App\Service\ProductCategoryService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class ProductCategoryController extends BaseController
{
    private $autoMapping;
    private $productCategoryService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ProductCategoryService $productCategoryService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->productCategoryService = $productCategoryService;
    }
    
    /**
     * @Route("/createproductcategory", name="createProductCategory", methods={"POST"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function createProductCategory(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ProductCategoryCreateRequest::class, (object)$data);
        $result = $this->productCategoryService->createProductCategory($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("/updateproductcategory", name="updateProductCategory", methods={"PUT"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function updateProductCategory(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ProductCategoryUpdateRequest::class, (object)$data);
        $result = $this->productCategoryService->updateProductCategory($request);

        return $this->response($result, self::CREATE);
    }

    /**
      * @Route("/productcategories", name="getProductCategories", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
      public function getProductCategories()
      {
          $result = $this->productCategoryService->getProductCategories();
  
          return $this->response($result, self::FETCH);
      }

    /**
      * @Route("/productcategory/{id}", name="getProductCategory", methods={"GET"})
      * @param Request $request
      * @return JsonResponse
      */
      public function getProductCategory($id)
      {
          $result = $this->productCategoryService->getProductCategory($id);
  
          return $this->response($result, self::FETCH);
      }

}
