<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\ClientProfileCreateRequest;
use App\Request\ClientProfileUpdateRequest;
use App\Request\UserRegisterRequest;
use App\Service\ClientProfileService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;


class ClientProfileController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $clientProfileService;
   

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, ClientProfileService $clientProfileService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->clientProfileService = $clientProfileService;     
    }

     /**
     * @Route("/clientregister", name="clientRegister", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function clientRegister(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        

        $request = $this->autoMapping->map(stdClass::class, UserRegisterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->clientProfileService->clientRegister($request);
       
        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("/userprofile", name="createUserProfile", methods={"POST"})
     * @IsGranted("ROLE_CLIENT")
     * @param Request $request
     * @return JsonResponse
     */
    public function createUserProfile(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ClientProfileCreateRequest::class, (object)$data);
       
        $request->setUserID($this->getUserId());
       
        $response = $this->clientProfileService->createUserProfile($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("/userprofile", name="updateUserProfile", methods={"PUT"})
     * @IsGranted("ROLE_CLIENT")
     * @param Request $request
     * @return JsonResponse
     */
    public function updateUserProfile(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, ClientProfileUpdateRequest::class, (object)$data);
        $request->setUserID($this->getUserId());

        $response = $this->clientProfileService->updateUserProfile($request);

        return $this->response($response, self::UPDATE);
    }

    /**
     * @Route("/userprofile", name="getUserProfileByUserId",methods={"GET"})
     * @IsGranted("ROLE_CLIENT")
     * @return JsonResponse
     */
    public function getUserProfileByUserID()
    {
        $response = $this->clientProfileService->getUserProfileByUserID($this->getUserId());

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/userprofilebyid/{id}", name="getUserProfileByID",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getUserProfileByID($id)
    {
        $response = $this->clientProfileService->getUserProfileByID($id);

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/usersprfile", name="getUsersProfile",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getUsersProfile()
    {
        $response = $this->clientProfileService->getUsersProfile();

        return $this->response($response, self::FETCH);
    }
}
