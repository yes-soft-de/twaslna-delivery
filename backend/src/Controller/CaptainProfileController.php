<?php

namespace App\Controller;

use App\AutoMapping;
use App\Request\CaptainProfileCreateRequest;
use App\Request\CaptainProfileUpdateRequest;
use App\Request\CaptainProfileUpdateLocationRequest;
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
        $isArray = is_array($response);
        if($isArray){
            $found = isset($response['found']);
        
            if( $found == "yes"){
                return $this->response($response, self::ERROR_USER_FOUND); 
          }
        }
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
        $response = $this->captainProfileService->updateCaptainProfile($request);
        return $this->response($response, self::UPDATE);  
    }

    /**
     * @Route("/captainProfileUpdateLocation", name="captainProfileUpdateLocation", methods={"PUT"})
     * @IsGranted("ROLE_CAPTAIN")
     * @param Request $request
     * @return JsonResponse
     */
    public function captainProfileUpdateLocation(Request $request)
    {
        $response="error lon or lat";
        $data = json_decode($request->getContent(), true);

        $request = $this->autoMapping->map(stdClass::class, CaptainProfileUpdateLocationRequest::class, (object)$data);
        $request->setUserID($this->getUserId());

        $lon = isset($request->getLocation()["lon"]);
        $lat = isset($request->getLocation()["lat"]);
        if( $lon == true && $lat == true) {
            $response = $this->captainProfileService->captainProfileUpdateLocation($request);
            return $this->response($response, self::UPDATE);
        }
        return $this->response($response, self::ERROR);
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
     * @Route("/captainProfile/{captainID}", name="getCaptainProfileByCaptainIDForAdmin",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     *  @return JsonResponse
     */
    public function getCaptainProfileByCaptainIDForAdmin($captainID)
    {
        $response = $this->captainProfileService->getCaptainProfileByCaptainIDForAdmin($captainID);

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
     * @Route("/captainsUnfinishedPayments", name="getCaptainsWithUnfinishedPayments",methods={"GET"})
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

    /**
     * @Route("/captainFinancialAccount", name="getCaptainMyBalance",methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN")
     *  @return JsonResponse
     */
    public function getCaptainFinancialAccountDetailsByCaptainId()
    {
        $response = $this->captainProfileService->getCaptainFinancialAccountDetailsByCaptainId($this->getUserId());

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainFinancialAccountInLastMonth", name="captainFinancialAccountInLastMonth",methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN")
     *  @return JsonResponse
     */
    public function captainFinancialAccountInLastMonth()
    {
        $response = $this->captainProfileService->captainFinancialAccountInLastMonth($this->getUserId());

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainFinancialAccountInSpecificDate/{fromDate}/{toDate}", name="captainFinancialAccountInSpecificDate",methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN")
     *  @return JsonResponse
     */
    public function captainFinancialAccountInSpecificDate($fromDate, $toDate)
    {
        $response = $this->captainProfileService->captainFinancialAccountInSpecificDate($this->getUserId(), $fromDate, $toDate);

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/countOrdersCaptainDeliveredInToday", name="countOrdersCaptainDeliveredInToday",methods={"GET"})
     * @IsGranted("ROLE_CAPTAIN")
     *  @return JsonResponse
     */
    public function countOrdersCaptainDeliveredInToday()
    {
        $response = $this->captainProfileService->countOrdersCaptainDeliveredInToday($this->getUserId());

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainFinancialAccountForAdmin/{captainID}", name="captainFinancialAccountForAdmin",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     *  @return JsonResponse
     */
    public function getCaptainFinancialAccountDetailsByCaptainIdForAdmin($captainID)
    {
        $response = $this->captainProfileService->getCaptainFinancialAccountDetailsByCaptainIdForAdmin($captainID);

        return $this->response($response, self::FETCH);
    }

     /**
     * @Route("/captainFinancialAccountInLastMonthForAdmin/{captainID}", name="captainFinancialAccountInLastMonthForAdmin",methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     *  @return JsonResponse
     */
    public function captainFinancialAccountInLastMonthForAdmin($captainID)
    {
        $response = $this->captainProfileService->captainFinancialAccountInLastMonthForAdmin($captainID);

        return $this->response($response, self::FETCH);
    }

    /**
     * @Route("/captainFilter/{name}", name="getCaptainsByName", methods={"GET"})
     * @IsGranted("ROLE_ADMIN")
     */
    public function captainFilter($name)
    {
        $result = $this->captainProfileService->captainFilter($name);

        return $this->response($result, self::FETCH);
    }
}
