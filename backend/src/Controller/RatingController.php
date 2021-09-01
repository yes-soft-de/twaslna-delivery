<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\RatingCreateRequest;
use App\Service\RatingService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class RatingController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $ratingService;

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, RatingService $ratingService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->ratingService = $ratingService;
    }

    /**
     * @Route("rating", name="createRatingByCaptainOrClient", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function createRatingByCaptainOrClient(Request $request)
    {
            $data = json_decode($request->getContent(), true);

            $request = $this->autoMapping->map(stdClass::class, RatingCreateRequest::class, (object)$data);

            $request->setUserID($this->getUserId());

            $result = $this->ratingService->createRatingByCaptainOrClient($request);

        return $this->response($result, self::CREATE);
    }

}
