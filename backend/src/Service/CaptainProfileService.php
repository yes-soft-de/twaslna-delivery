<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\CaptainProfileEntity;
use App\Entity\UserEntity;
use App\Request\CaptainProfileCreateRequest;
use App\Request\CaptainVacationCreateRequest;
use App\Request\CaptainProfileUpdateRequest;
use App\Request\CaptainProfileUpdateLocationRequest;
use App\Request\UserRegisterRequest;
use App\Request\CaptainProfileUpdateByAdminRequest;
use App\Response\CaptainIsActiveResponse;
use App\Response\CaptainProfileCreateResponse;
use App\Response\CaptainFinancialAccountDetailsResponse;
use App\Response\CaptainFinancialAccountDetailsForAdminResponse;
use App\Response\CaptainTotalFinancialAccountInMonthResponse;
use App\Response\CaptainTotalFinancialAccountInMonthForAdminResponse;
use App\Response\CaptainCountOrdersDeliveredInTodayResponse;
use App\Response\UserRegisterResponse ;
use App\Service\CaptainPaymentService;
use App\Service\RoomIdHelperService;
use App\Service\CaptainService;
use App\Service\RatingService;
use App\Service\DateFactoryService;
use App\Manager\UserManager;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use DateTime;

class CaptainProfileService
{
    private $autoMapping;
    private $userManager;
    private $ratingService;
    private $params;
    private $captainPaymentService;
    private $roomIdHelperService;
    private $dateFactoryService;
    private $captainService;

    public function __construct(AutoMapping $autoMapping, ParameterBagInterface $params, CaptainPaymentService $captainPaymentService,  RoomIdHelperService $roomIdHelperService, UserManager $userManager,
      RatingService $ratingService, DateFactoryService $dateFactoryService, CaptainService $captainService)
    {
        $this->autoMapping = $autoMapping;
        $this->captainPaymentService = $captainPaymentService;
        $this->roomIdHelperService = $roomIdHelperService;
        $this->userManager = $userManager;
        $this->ratingService = $ratingService;
        $this->dateFactoryService = $dateFactoryService;
        $this->captainService = $captainService;

        $this->params = $params->get('upload_base_url') . '/';
    }
    
    public function captainRegister(UserRegisterRequest $request)
    {
        $roomID = $this->roomIdHelperService->roomIdGenerate();
        $userRegister = $this->userManager->captainRegister($request, $roomID);
        if ($userRegister instanceof UserEntity) {
            
        return $this->autoMapping->map(UserEntity::class, UserRegisterResponse::class, $userRegister);

        }
        if ($userRegister == true) {
          
            $user = $this->userManager->getUserByUserID($request->getUserID());
            $user['found']="yes";
            return $user;
        }
    }

    public function createCaptainProfile(CaptainProfileCreateRequest $request)
    { 
        $roomID = $this->roomIdHelperService->roomIdGenerate();
        $captainProfile = $this->userManager->createCaptainProfile($request, $roomID);
        
        if ($captainProfile instanceof CaptainProfileEntity) {
           
            return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $captainProfile);
        }
        if ($captainProfile == true) {
            return $this->getCaptainProfileByCaptainID($request->getCaptainID());
        }
    }

    public function updateCaptainProfile(CaptainProfileUpdateRequest $request)
    {
        $item = $this->userManager->updateCaptainProfile($request);
        
        return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $item);
    }

    public function captainProfileUpdateLocation(CaptainProfileUpdateLocationRequest $request)
    {
        $item = $this->userManager->captainProfileUpdateLocation($request);
        
        return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $item);
    }

    public function updateCaptainProfileByAdmin(CaptainProfileUpdateByAdminRequest $request)
    {
        $item = $this->userManager->updateCaptainProfileByAdmin($request);

        return $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $item);
    }

    public function updateCaptainStateByAdmin(CaptainVacationCreateRequest $request)
    {
        return $this->userManager->updateCaptainStateByAdmin($request);

    }

    public function getCaptainProfileByCaptainID($captainID):object
    {
        $response=(object)[];

        $item = $this->userManager->getCaptainProfileByCaptainID($captainID);

        $bounce = $this->getCaptainFinancialAccountDetailsByCaptainId($captainID);

        $countOrdersDeliverd = $this->captainService->countCaptainOrdersDelivered($captainID);

        $item['imageURL'] = $item['image'];
        $item['image'] = $this->params.$item['image'];
        $item['drivingLicenceURL'] = $item['drivingLicence'];
        $item['drivingLicence'] = $this->params.$item['drivingLicence'];
        $item['baseURL'] = $this->params;
        $item['rating'] = $this->ratingService->getAvgRating($captainID, 'captain');
       
        $response = $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $item);

        $response->bounce = $bounce;
        $response->countOrdersDeliverd = $countOrdersDeliverd;

        return $response;
    }

    public function getCaptainProfileByCaptainIDForAdmin($captainID)
    {
        $response=[];
        $totalBounce=[];
        $countOrdersDeliverd=[];
        $item = $this->userManager->getCaptainProfileByCaptainID($captainID);
        if($item) {
            // $totalBounce = $this->getCaptainFinancialAccountDetailsByCaptainProfileId($item['id']);
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['drivingLicenceURL'] = $item['drivingLicence'];
            $item['drivingLicence'] = $this->params.$item['drivingLicence'];
            $item['baseURL'] = $this->params;
            // $countOrdersDeliverd = $this->captainService->countCaptainOrdersDelivered($item['captainID']);

            $item['rating'] = $this->ratingService->getAvgRating($item['captainID'], 'captain');
        }
        $response =  $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $item);
        // if($item) {
            // $response->totalBounce = $totalBounce;
            // $response->countOrdersDeliverd = $countOrdersDeliverd;
        // }
        return $response;
    }

    public function getCaptainsInactive():array
    {
        $response = [];
        $items = $this->userManager->getCaptainsInactive();
        foreach( $items as  $item ) {
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['drivingLicenceURL'] = $item['drivingLicence'];
            $item['drivingLicence'] = $this->params.$item['drivingLicence'];
            $item['baseURL'] = $this->params;
            $response[]  = $this->autoMapping->map('array', CaptainProfileEntity::class, $item);
            }
     return $response;
    }
    
    public function captainIsActive($captainID)
    {
        $item = $this->userManager->captainIsActive($captainID);
        return $this->autoMapping->map('array',CaptainIsActiveResponse::class, $item);


     }

     public function dashboardCaptains():array
     {
         $response = [];

         $response[] = $this->userManager->countpendingCaptains();
         $response[] = $this->userManager->countOngoingCaptains();
         $response[] = $this->userManager->countDayOfCaptains();

         $top5Captains = $this->getTop5Captains();
      
         foreach ($top5Captains as $item) {
           
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['baseURL'] = $this->params;   

            $response[]  = $this->autoMapping->map('array',CaptainProfileCreateResponse::class,  $item);
         }         
         return $response;
     }

     public function getCaptainsInVacation():array
     {
         $response = [];

         $dayOfCaptains = $this->userManager->getCaptainsInVacation();
      
         foreach ($dayOfCaptains as $item) {
            $item['imageURL'] = $item['image'];
            $item['image'] = $this->params.$item['image'];
            $item['drivingLicenceURL'] = $item['drivingLicence'];
            $item['drivingLicence'] = $this->params.$item['drivingLicence'];
            $item['baseURL'] = $this->params;

            $response[]  = $this->autoMapping->map('array',CaptainProfileCreateResponse::class,  $item);
         }         
         return $response;
     }
 
    public function getOrderKilometers($captainId)
     {
       $sumKilometerBonus = [];
       $orderKilometers = $this->captainService->getOrderKilometers($captainId);
       foreach ($orderKilometers as $orderKilometer) {
        if ($orderKilometer['orderKilometers'] >= $orderKilometer['kilometers']) {
            $Kilometer = $orderKilometer['orderKilometers'] - $orderKilometer['kilometers'];
            $kilometerBonus1 = $Kilometer * $orderKilometer['maxKilometerBonus'];
            $sumKilometerBonus[] = $kilometerBonus1; 
        }

        if ($orderKilometer['orderKilometers'] < $orderKilometer['kilometers']) {
            $Kilometer = $orderKilometer['orderKilometers'];
            $kilometerBonus2 = $Kilometer * $orderKilometer['minKilometerBonus'];
            $sumKilometerBonus[] = $kilometerBonus2; 

        }
       }
        return array_sum($sumKilometerBonus);
     }
    
    public function getOrderKilometersInThisMonth($captainId, $fromDate, $toDate)
    {
      $sumKilometerBonus = [];
      $orderKilometers = $this->captainService->getOrderKilometersInThisMonth($captainId, $fromDate, $toDate);

      foreach ($orderKilometers as $orderKilometer) {
       if ($orderKilometer['orderKilometers'] >= $orderKilometer['kilometers']) {
           $Kilometer = $orderKilometer['orderKilometers'] - $orderKilometer['kilometers'];
           $kilometerBonus1 = $Kilometer * $orderKilometer['maxKilometerBonus'];
           $sumKilometerBonus[] = $kilometerBonus1; 
       }

       if ($orderKilometer['orderKilometers'] < $orderKilometer['kilometers']) {
           $Kilometer = $orderKilometer['orderKilometers'];
           $kilometerBonus2 = $Kilometer * $orderKilometer['minKilometerBonus'];
           $sumKilometerBonus[] = $kilometerBonus2; 

       }
      }
       return array_sum($sumKilometerBonus);
    }

    public function getCaptainFinancialAccountDetailsByCaptainId($captainId):array
    {
        $response=[];

        $item = $this->userManager->getCaptainAsArrayByCaptainId($captainId);
    
        $sumPaymentsFromCompany = $this->captainPaymentService->sumPaymentsFromCompany($captainId);
        $sumPaymentsToCompany = $this->captainPaymentService->sumPaymentsToCompany($captainId);
       
        if ($item) {
             $countOrdersDelivered = $this->captainService->countCaptainOrdersDelivered($item[0]['captainID']);            
             $sumKilometerBonus = $this->getOrderKilometers($captainId);
             
             $item['countOrdersDelivered'] = (float)$countOrdersDelivered[0]['countOrdersDelivered'];
             $item['kilometerBonus'] = $sumKilometerBonus;

             $item['sumInvoiceAmount'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'];
             $item['deliveryCost'] = (float)$countOrdersDelivered[0]['deliveryCost'];
             $item['amountYouOwn'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'] + $countOrdersDelivered[0]['deliveryCost'];

             $item['sumPaymentsFromCompany'] = (float)$sumPaymentsFromCompany[0]['sumPaymentsFromCompany'];
             $item['sumPaymentsToCompany'] = (float)$sumPaymentsToCompany[0]['sumPaymentsToCompany'];
             $item['remainingAmountForCompany'] = (float)$item['amountYouOwn'] - $item['sumPaymentsToCompany'];
             
             $item['bounce'] = $item[0]['bounce'] * $item['countOrdersDelivered'];
             $item['salary'] = $item[0]['salary'];
             $item['netProfit'] = $item['bounce'] + $item['salary'] + $item['kilometerBonus'];
             $item['total'] = $item['netProfit'] - $item['sumPaymentsFromCompany'];
            //  $item['payments'] = $payments;

             $response[] = $this->autoMapping->map('array', CaptainFinancialAccountDetailsResponse::class,  $item);
            
        }
        return $response;
    }

    public function getCaptainFinancialAccountDetailsByCaptainIdForAdmin($captainId):array
    {
        $response=[];

        $item = $this->userManager->getCaptainAsArrayByCaptainId($captainId);
    
        $sumPaymentsToCaptain = $this->captainPaymentService->sumPaymentsFromCompany($captainId);
        $sumPaymentsFromCaptain = $this->captainPaymentService->sumPaymentsToCompany($captainId);

        $paymentsToCaptain = $this->captainPaymentService->getCaptainPaymentsFromCompany($captainId);
        $paymentsFromCaptain = $this->captainPaymentService->getCaptainPaymentsToCompany($captainId);
       
        if ($item) {
             $countOrdersDelivered = $this->captainService->countCaptainOrdersDelivered($item[0]['captainID']);            
             $sumKilometerBonus = $this->getOrderKilometers($captainId);
             
             $item['countOrdersDelivered'] = (float)$countOrdersDelivered[0]['countOrdersDelivered'];
             $item['kilometerBonus'] = $sumKilometerBonus;

             $item['sumInvoiceAmount'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'];
             $item['deliveryCost'] = (float)$countOrdersDelivered[0]['deliveryCost'];
             $item['amountWithCaptain'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'] + $countOrdersDelivered[0]['deliveryCost'];

             $item['sumPaymentsToCaptain'] = (float)$sumPaymentsToCaptain[0]['sumPaymentsFromCompany'];
             $item['sumPaymentsFromCaptain'] = (float)$sumPaymentsFromCaptain[0]['sumPaymentsToCompany'];
             $item['remainingAmountForCompany'] = (float)$item['amountWithCaptain'] - $item['sumPaymentsFromCaptain'];
             
             $item['bounce'] = $item[0]['bounce'] * $item['countOrdersDelivered'];
             $item['salary'] = $item[0]['salary'];
             $item['NetProfit'] = $item['bounce'] + $item['salary'] + $item['kilometerBonus'];
             
             // + Positive: the account is on the captain
             // - Negative: the account is for the captain
             $item['total'] = $item['sumPaymentsToCaptain'] - $item['NetProfit'];
             $item['paymentsToCaptain'] = $paymentsToCaptain;
             $item['paymentsFromCaptain'] = $paymentsFromCaptain;

             $response[] = $this->autoMapping->map('array', CaptainTotalFinancialAccountInMonthForAdminResponse::class,  $item);
            
        }
        return $response;
    }

    public function captainFinancialAccountInLastMonth($captainId):array
    {
        $response = [];
        $dateNow = new DateTime("now");
        $year = $dateNow->format("Y");
        $month = $dateNow->format("m");
        $date = $this->dateFactoryService->returnLastMonthDate($year, $month);

        $item = $this->userManager->getCaptainAsArrayByCaptainId($captainId);
    
        $sumPaymentsFromCompany = $this->captainPaymentService->getSumPaymentsFromCompanyInSpecificDate($captainId, $date[0], $date[1]);
        $sumPaymentsToCompany = $this->captainPaymentService->getSumPaymentsToCompanyInSpecificDate($captainId, $date[0], $date[1]);
        if( $sumPaymentsFromCompany[0]['sumPayments'] == null) { 
            $sumPaymentsFromCompany[0]['sumPayments'] = (float)0; 
             }
        if( $sumPaymentsToCompany[0]['sumPayments'] == null) { 
            $sumPaymentsToCompany[0]['sumPayments'] = (float)0; 
             }

        if ($item) {
            
             $countOrdersDelivered = $this->captainService->countOrdersInMonthForCaptain($date[0], $date[1], $item[0]['captainID']);           
             $paymentsFromCompany = $this->captainPaymentService->getPaymentsFromCompanyInSpecificDate( $item[0]['captainID'] ,$date[0], $date[1]);     

             $sumKilometerBonus = $this->getOrderKilometersInThisMonth($captainId, $date[0], $date[1]);
             $item['kilometerBonus'] = $sumKilometerBonus;

             $item['countOrdersDelivered'] = (float)$countOrdersDelivered[0]['countOrdersInMonth'];
             $item['sumInvoiceAmount'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'];
             $item['deliveryCost'] = (float)$countOrdersDelivered[0]['deliveryCost'];
             $item['amountYouOwn'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'] + $countOrdersDelivered[0]['deliveryCost'];

             $item['sumPaymentsFromCompany'] = (float)$sumPaymentsFromCompany[0]['sumPayments'];
             $item['sumPaymentsToCompany'] = (float)$sumPaymentsToCompany[0]['sumPayments'];
             $item['remainingAmountForCompany'] = (float)$item['amountYouOwn'] - $item['sumPaymentsToCompany'];
             $item['bounce'] = $item[0]['bounce'] * $item['countOrdersDelivered'];
             $item['salary'] = $item[0]['salary'];
             $item['NetProfit'] = $item['bounce'] + $item[0]['salary'] + $item['kilometerBonus'];;
             $item['total'] = $item['NetProfit'] - $item['sumPaymentsFromCompany'];
             $item['paymentsFromCompany'] = $paymentsFromCompany;

             $response[] = $this->autoMapping->map('array', CaptainTotalFinancialAccountInMonthResponse::class,  $item);
            
        }
        return $response;
    }

    public function captainFinancialAccountInLastMonthForAdmin($captainID):array
    {
        $response = [];
        $dateNow = new DateTime("now");
        $year = $dateNow->format("Y");
        $month = $dateNow->format("m");
        $date = $this->dateFactoryService->returnLastMonthDate($year, $month);

        $item = $this->userManager->getCaptainAsArrayByCaptainId($captainID);
    
        $sumPaymentsToCaptain = $this->captainPaymentService->getSumPaymentsFromCompanyInSpecificDate($captainID, $date[0], $date[1]);
        $sumPaymentsFromCaptain = $this->captainPaymentService->getSumPaymentsToCompanyInSpecificDate($captainID, $date[0], $date[1]);
        if( $sumPaymentsToCaptain[0]['sumPayments'] == null) { 
            $sumPaymentsToCaptain[0]['sumPayments'] = (float)0; 
             }
        if( $sumPaymentsFromCaptain[0]['sumPayments'] == null) { 
            $sumPaymentsFromCaptain[0]['sumPayments'] = (float)0; 
             }

        if ($item) {
             $countOrdersDelivered = $this->captainService->countOrdersInMonthForCaptain($date[0], $date[1], $item[0]['captainID']);          
             $paymentsToCaptain = $this->captainPaymentService->getPaymentsFromCompanyInSpecificDate( $item[0]['captainID'] ,$date[0], $date[1]);     
            
             $paymentsFromCaptain = $this->captainPaymentService->getPaymentsToCompanyInSpecificDate( $item[0]['captainID'] ,$date[0], $date[1]);     

             $sumKilometerBonus = $this->getOrderKilometersInThisMonth($captainID, $date[0], $date[1]);
             $item['kilometerBonus'] = $sumKilometerBonus;

             $item['countOrdersDelivered'] = (float)$countOrdersDelivered[0]['countOrdersInMonth'];
             $item['sumInvoiceAmount'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'];
             $item['deliveryCost'] = (float)$countOrdersDelivered[0]['deliveryCost'];
             $item['amountWithCaptain'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'] + $countOrdersDelivered[0]['deliveryCost'];

             $item['sumPaymentsToCaptain'] = (float)$sumPaymentsToCaptain[0]['sumPayments'];
             $item['sumPaymentsFromCaptain'] = (float)$sumPaymentsFromCaptain[0]['sumPayments'];
             $item['remainingAmountForCompany'] = (float)$item['amountWithCaptain'] - $item['sumPaymentsFromCaptain'];
             $item['bounce'] = $item[0]['bounce'] * $item['countOrdersDelivered'];

             $item['salary'] = $item[0]['salary'];
            
             $item['NetProfit'] = $item['bounce'] + $item[0]['salary'] + $item['kilometerBonus'];
             // + Positive: the account is on the captain
             // - Negative: the account is for the captain
             $item['total'] =  $item['sumPaymentsToCaptain'] - $item['NetProfit'];
             $item['paymentsToCaptain'] = $paymentsToCaptain;
             $item['paymentsFromCaptain'] = $paymentsFromCaptain;

             $response[] = $this->autoMapping->map('array', CaptainTotalFinancialAccountInMonthForAdminResponse::class,  $item);
            
        }
        return $response;
    }

    public function captainFinancialAccountInSpecificDate($captainId, $fromDate, $toDate):array
    {
        $response = [];
      
        $date = $this->dateFactoryService->returnSpecificDate($fromDate, $toDate);

        $item = $this->userManager->getCaptainAsArrayByCaptainId($captainId);
    
        $sumPaymentsFromCompany = $this->captainPaymentService->getSumPaymentsFromCompanyInSpecificDate($captainId, $date[0], $date[1]);
        $sumPaymentsToCompany = $this->captainPaymentService->getSumPaymentsToCompanyInSpecificDate($captainId, $date[0], $date[1]);
        if( $sumPaymentsFromCompany[0]['sumPayments'] == null) { 
            $sumPaymentsFromCompany[0]['sumPayments'] = (float)0; 
             }
        if( $sumPaymentsToCompany[0]['sumPayments'] == null) { 
            $sumPaymentsToCompany[0]['sumPayments'] = (float)0; 
             }

        if ($item) {
            
             $countOrdersDelivered = $this->captainService->countOrdersInMonthForCaptain($date[0], $date[1], $item[0]['captainID']);           
             $paymentsFromCompany = $this->captainPaymentService->getPaymentsFromCompanyInSpecificDate( $item[0]['captainID'] ,$date[0], $date[1]);     

             $sumKilometerBonus = $this->getOrderKilometersInThisMonth($captainId, $date[0], $date[1]);
             $item['kilometerBonus'] = $sumKilometerBonus;

             $item['countOrdersDelivered'] = (float)$countOrdersDelivered[0]['countOrdersInMonth'];
             $item['sumInvoiceAmount'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'];
             $item['deliveryCost'] = (float)$countOrdersDelivered[0]['deliveryCost'];
             $item['amountYouOwn'] = (float)$countOrdersDelivered[0]['sumInvoiceAmount'] + $countOrdersDelivered[0]['deliveryCost'];

             $item['sumPaymentsFromCompany'] = (float)$sumPaymentsFromCompany[0]['sumPayments'];
             $item['sumPaymentsToCompany'] = (float)$sumPaymentsToCompany[0]['sumPayments'];
             $item['remainingAmountForCompany'] = (float)$item['amountYouOwn'] - $item['sumPaymentsToCompany'];
             $item['bounce'] = $item[0]['bounce'] * $item['countOrdersDelivered'];
             $item['salary'] = $item[0]['salary'];
             $item['NetProfit'] = $item[0]['bounce'] + $item[0]['salary'] + $item['kilometerBonus'];
             $item['total'] = $item['NetProfit'] - $item['sumPaymentsFromCompany'];
             $item['paymentsFromCompany'] = $paymentsFromCompany;

             $response[] = $this->autoMapping->map('array', CaptainTotalFinancialAccountInMonthResponse::class,  $item);
            
        }
        return $response;
    }

    public function countOrdersCaptainDeliveredInToday($captainID)
    {
        $response = [];
        $dateNow =new DateTime("now");
        $todayStart = $dateNow->format("Y-m-d 00:00:00");
        $todayEnd = $dateNow->format("Y-m-d 23:59:59");
       
        $countOrdersDeliveredInToday = $this->captainService->countOrdersDeliveredInToday($captainID, $todayStart, $todayEnd); 
        $response = $this->autoMapping->map('array', CaptainCountOrdersDeliveredInTodayResponse::class, $countOrdersDeliveredInToday);
        return  $response;
    }

    public function getAllCaptains():array
    {
        $response = [];
        $captains = $this->userManager->getAllCaptains();
        foreach ($captains as $captain) {
            $captain['imageURL'] = $captain['image'];
            $captain['image'] = $this->params.$captain['image'];
            $captain['drivingLicenceURL'] = $captain['drivingLicence'];
            $captain['drivingLicence'] = $this->params.$captain['drivingLicence'];
            $captain['baseURL'] = $this->params;

            $response[]  = $this->autoMapping->map('array',CaptainProfileCreateResponse::class,  $captain);
            }       
        return $response;
    }

    public function specialLinkCheck($bool)
    {
        if (!$bool)
        {
            return $this->params;
        }
    }

    public function getCaptainsWithUnfinishedPayments()
    {
        $response = [];
        $result = [];
        $captains = $this->userManager->getAllCaptains();
     
        foreach ($captains as $captain) {
                 $totalBounce = $this->getCaptainFinancialAccountDetailsByCaptainIdForAdmin($captain['captainID']);

                 $total=$totalBounce[0]->total;
                 $captain['total'] = $total;

                if ($captain['total'] < 0 ){
                $response[] =  $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $captain);
                  }
        } 
        $result['response'] = $response;
        return $result;
    }

    public function updateCaptainNewMessageStatus($request, $NewMessageStatus)
    {
        $item = $this->userManager->getcaptainByRoomID($request->getRoomID());
   
       $response = $this->userManager->updateCaptainNewMessageStatus($item, $NewMessageStatus);
    
       return  $this->autoMapping->map(CaptainProfileEntity::class, CaptainProfileCreateResponse::class, $response);
    }

    public function getTop5Captains()
    {
       return $this->userManager->getTop5Captains();
    }

    public function getTopCaptainsInLastMonthDate():array
    {
       $response = [];
       $date = $this->dateFactoryService->returnLastMonthDate();
       $topCaptains = $this->userManager->getTopCaptainsInLastMonthDate($date[0],$date[1]);
     
        foreach ($topCaptains as $topCaptain) {
            $topCaptain['imageURL'] = $topCaptain['image'];
            $topCaptain['image'] = $this->params.$topCaptain['image'];
            $topCaptain['drivingLicenceURL'] = $topCaptain['drivingLicence'];
            $topCaptain['drivingLicence'] = $this->params.$topCaptain['drivingLicence'];
            $topCaptain['baseURL'] = $this->params;
            $response[] = $this->autoMapping->map('array', CaptainProfileCreateResponse::class, $topCaptain);
        }
    
       return $response;
   }

   public function countCaptains() {
    return $this->userManager->countCaptains();
   }
}
