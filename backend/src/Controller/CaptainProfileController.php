<?php

namespace App\Controller;

use App\AutoMapping;

use App\Request\CaptainProfileCreateRequest;
use App\Request\CaptainProfileUpdateRequest;
use App\Request\CaptainProfileUpdateByAdminRequest;
use App\Request\UserRegisterRequest;
use App\Service\CaptainProfileService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;


class CaptainProfileController extends BaseController
{
    private $autoMapping;
    private $validator;
    private $captainProfileService;
   

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, ValidatorInterface $validator, CaptainProfileService $captainProfileService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->validator = $validator;
        $this->captainProfileService = $captainProfileService;
        
    }

     /**
     * @Route("/captainregister", name="captainRegister", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function captainRegister(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        

        $request = $this->autoMapping->map(stdClass::class, UserRegisterRequest::class, (object)$data);

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->captainProfileService->captainRegister($request);
       
        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("/captainprofile", name="createCaptainProfile", methods={"POST"})
     * @IsGranted("ROLE_CAPTAIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function createCaptainProfile(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, CaptainProfileCreateRequest::class, (object)$data);

        $request->setCaptainID($this->getUserId());

        $violations = $this->validator->validate($request);
        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->captainProfileService->createCaptainProfile($request);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("/captainprofile", name="captainProfileUpdate", methods={"PUT"})
     * @IsGranted("ROLE_CAPTAIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function updateCaptainProfile(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, CaptainProfileUpdateRequest::class, (object)$data);
        $request->setUserID($this->getUserId());
        $violations = $this->validator->validate($request);

        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->captainProfileService->updateCaptainProfile($request);

        return $this->response($response, self::UPDATE);
    }
  
    /**
     * @Route("/captainprofileupdatebyadmin", name="captainProfileUpdateByAdmin", methods={"PUT"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function updateCaptainProfileByAdmin(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, CaptainProfileUpdateByAdminRequest::class, (object)$data);

        $violations = $this->validator->validate($request);

        if (\count($violations) > 0) {
            $violationsString = (string) $violations;

            return new JsonResponse($violationsString, Response::HTTP_OK);
        }

        $response = $this->captainProfileService->UpdateCaptainProfileByAdmin($request);

        return $this->response($response, self::UPDATE);
    }

    
    /**
     * @Route("/captainprofile", name="getCaptainprofileByCaptainID",methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN")
     *  @return JsonResponse
     */
    public function getCaptainProfileByCaptainID()
    {
        $response = $this->captainProfileService->getCaptainProfileByCaptainID($this->getUserId());

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainprofile/{captainProfileId}", name="getCaptainprofileBycaptainProfileId",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     *  @return JsonResponse
     */
    public function getCaptainProfileByID($captainProfileId)
    {
        $response = $this->captainProfileService->getCaptainProfileByID($captainProfileId);

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/getcaptainsinactive", name="getCaptainsPending",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     *  @return JsonResponse
     */
    public function getCaptainsInactive()
    {
        $response = $this->captainProfileService->getCaptainsInactive();

        return $this->response($response, self::FETCH);
    }
//هذا غير مستخدم ولكن يجب أن تتأكد
    // /**
    //  * @Route("/getCaptainsState/{state}", name="getCaptainsState",methods={"GET"})
    //  * @IsGranted("ROLE_ADMIN")
    //  *  @return JsonResponse
    //  */
    // public function getCaptainsState($state)
    // {
    //     $response = $this->userService->getCaptainsState($state);

    //     return $this->response($response, self::FETCH);
    // }

    /**
     * @Route("/dashboardcaptains", name="dashboardCaptains",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function dashboardCaptains()
    {
        $result = $this->captainProfileService->dashboardCaptains();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/getdayofcaptains", name="getDayOfCaptains",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function getCaptainsInVacation()
    {
        $result = $this->captainProfileService->getCaptainsInVacation();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/captainFinancialaccount/{captainProfileId}", name="TotalBounceCaptain",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function getCaptainFinancialAccountDetailsByCaptainProfileId($captainProfileId)
    {
        $result = $this->captainProfileService->getCaptainFinancialAccountDetailsByCaptainProfileId($captainProfileId);

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/captains", name="getCaptains",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getAllCaptains()
    {
        $response = $this->captainProfileService->getAllCaptains();

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainFinancialaccount", name="getCaptainMyBalance",methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN")
     *  @return JsonResponse
     */
    public function getCaptainFinancialAccountDetailsByCaptainId()
    {
        $response = $this->captainProfileService->getCaptainFinancialAccountDetailsByCaptainId($this->getUserId());

        return $this->response($response, self::FETCH);
    }

     /**
     * @Route("/ccaptainsunfinishedpayments", name="getCaptainsWithUnfinishedPayments",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @return JsonResponse
     */
    public function getCaptainsWithUnfinishedPayments()
    {
        $response = $this->captainProfileService->getCaptainsWithUnfinishedPayments();

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainupdatenewmessagestatus", name="captainUpdateNewMessageStatus", methods={"PUT"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function updateCaptainNewMessageStatus(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class,CaptainProfileUpdateByAdminRequest::class,(object)$data);
        
        $response = $this->captainProfileService->updateCaptainNewMessageStatus($request,false);

        return $this->response($response, self::CREATE);
    }

    /**
     * @Route("/gettop5captains", name="GetTop5Captains",methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function getTop5Captains()
    {
        $result = $this->captainProfileService->getTop5Captains();

        return $this->response($result, self::FETCH);
    }

    /**
     * @Route("/topCaptains", name="getTopCaptainsInThisMonth",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function getTopCaptainsInLastMonthDate()
    {
        $result = $this->captainProfileService->getTopCaptainsInLastMonthDate();

        return $this->response($result, self::FETCH);
    }
}
