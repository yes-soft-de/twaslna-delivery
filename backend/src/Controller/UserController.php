<?php

namespace App\Controller;

use App\AutoMapping;

use App\Service\UserService;
use stdClass;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;


class UserController extends BaseController
{
    private $autoMapping;
    private $userService;
   

    public function __construct(SerializerInterface $serializer, AutoMapping $autoMapping, UserService $userService)
    {
        parent::__construct($serializer);
        $this->autoMapping = $autoMapping;
        $this->userService = $userService;
        
    }

     /**
     * @Route("/checkUserType/{userType}", name="checkUserType", methods={"POST"})
     * @param Request $request
     * @return JsonResponse
     */
    public function checkUserType($userType)
    {
        $response = $this->userService->checkUserType($userType,$this->getUserId());
       
        if($response == "yes"){
            $response ="yes is"." ".$userType;
            return $this->response($response, self::CREATE); 
          }
        if($response == "no"){
            $response ="no not a"." ".$userType;
            return $this->response($response, self::ERROR); 
          }
    }
}