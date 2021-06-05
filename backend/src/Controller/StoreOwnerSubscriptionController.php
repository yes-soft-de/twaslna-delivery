<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\StoreOwnerSubscriptionCreateRequest;
use App\Request\StoreOwnerSubscriptionNextRequest;
use App\Request\StoreOwnerSubscriptionUpdateStateRequest;
use App\Service\StoreOwnerSubscriptionService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class StoreOwnerSubscriptionController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $storeOwnersubscriptionService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, storeOwnersubscriptionService $storeOwnersubscriptionService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->storeOwnersubscriptionService = $storeOwnersubscriptionService;
    }

    /**
     * @Route("storeownersubscription", name="createSubscription", methods={"POST"})
     * @IsGranted("ROLE_OWNER")
     * @param Request $request
     * @return JsonResponse
     */
    public function createStoreOwnerSubscription(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, StoreOwnerSubscriptionCreateRequest::class, (object)$data);

        $request->setOwnerID($this->getUserId());

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->storeOwnersubscriptionService->createStoreOwnerSubscription($request);

        return $this->response($result, self::CREATE);
    }
    /**
     * @Route("storeownersubscriptionrenew", name="nxetSubscription", methods={"POST"})
     * @IsGranted("ROLE_OWNER")
     * @param Request $request
     * @return JsonResponse
     */
    public function storeOwnerSubscriptionRenew(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, StoreOwnerSubscriptionNextRequest::class, (object)$data);

        $request->setOwnerID($this->getUserId());

        $result = $this->storeOwnersubscriptionService->storeOwnerSubscriptionRenew($request);

        return $this->response($result, self::CREATE);
    }

    /**
     * @Route("storeownersubscriptionforowner", name="getSubscriptionForOwner", methods={"GET"})
     * @IsGranted("ROLE_OWNER")
     * @return JsonResponse
     */
    public function getStoreOwnerSubscriptionforowner()
    {
        $result = $this->storeOwnersubscriptionService->getStoreOwnerSubscriptionforowner($this->getUserId());

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("storeownersubscriptionUpdateState", name="SubscriptionUpdateState", methods={"PUT"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function storeOwnerSubscriptionUpdateState(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(\stdClass::class, StoreOwnerSubscriptionUpdateStateRequest::class, (object) $data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $result = $this->storeOwnersubscriptionService->storeOwnerSubscriptionUpdateState($request);

        return $this->response($result, self::UPDATE);
    }

    /**
     * @Route("storeownersubscriptionpending", name="getSubscriptionsPending", methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getStoreOwnerSubscriptionPending()
    {
        $result = $this->storeOwnersubscriptionService->getStoreOwnerSubscriptionPending();

        return $this->response($result, self::FETCH);
    }
    
    /**
     * @Route("storeownersubscriptionbyid/{id}", name="getStoreOwnerSubscriptionById", methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getStoreOwnerSubscriptionById($id)
    {
        $result = $this->storeOwnersubscriptionService->getStoreOwnerSubscriptionById($id);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/dashboardContracts/{year}/{month}", name="dashboardContracts",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function dashboardContracts($year, $month)
    {
        $result = $this->storeOwnersubscriptionService->dashboardContracts($year, $month);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/storeownersubscriptionbalance", name="packagebalanceForOwner",methods={"GET"})
     * @IsGranted("ROLE_OWNER")
     * @param Request $request
     * @return JsonResponse
     */
    public function storeOwnerSubscriptionBalance()
    {
        $result = $this->storeOwnersubscriptionService->storeOwnerSubscriptionBalance($this->getUserId());

        return $this->response($result, self::FETCH);
    }
}
