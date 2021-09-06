<?php


namespace App\Controller;


// use App\Entity\AnnouncementEntity;
// use App\Entity\AppointmentEntity;
// use App\Entity\CaptainPaymentEntity;
// use App\Entity\CaptainProfileEntity;
// use App\Entity\CaptainTermEntity;
// use App\Entity\CaptainVacationEntity;
// use App\Entity\ClientPaymentEntity;
// use App\Entity\ClientProfileEntity;
// use App\Entity\DeliveryCompanyPackageEntity;
// use App\Entity\DeliveryCompanyProfileEntity;
// use App\Entity\NotificationTokenEntity;
// use App\Entity\OrderDetailEntity;
// use App\Entity\OrderEntity;
// use App\Entity\OrderLogEntity;
// use App\Entity\ProductCategoryEntity;
// use App\Entity\ProductEntity;
// use App\Entity\RatingEntity;
// use App\Entity\RoomIdHelperEntity;
// use App\Entity\StoreCategoryEntity;
// use App\Entity\StoreOwnerBranchEntity;
// use App\Entity\StoreOwnerPaymentEntity;
// use App\Entity\StoreOwnerProfileEntity;
// use App\Entity\StoreOwnerSubscriptionEntity;
// use App\Entity\StoreProductCategoryEntity;
// use App\Entity\StoreProductEntity;
// use App\Entity\SupportEntity;
// use App\Entity\UserEntity;
use Doctrine\ORM\Tools\SchemaTool;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class EraseController extends BaseController
{
    /**
    * @Route("dropalltables", name="deleteAllDatabaseTables", methods={"DELETE"})
    */
   public function dropAllTablesOfDB()
   {
       $em = $this->getDoctrine()->getManager();
       $entitiesArray = $this->getDoctrine()->getManager()->getMetadataFactory()->getAllMetadata();

       $tool = new SchemaTool($em);

       $tool->dropSchema($entitiesArray);
       $tool->createSchema($entitiesArray);

       if($tool)
       {
           return $this->response("ِAll data were being deleted", self::DELETE);
       }
   }

    // /**
    //  * @Route("eraseAll", name="deleteAllData", methods={"DELETE"})
    //  * 
    //  */
    // public function eraseAllData()
    // {
    //     try
    //     {
    //         $em = $this->getDoctrine()->getManager();

    //         $em->getRepository(AnnouncementEntity::class)->createQueryBuilder('AnnouncementEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();
                
    //         $em->getRepository(AppointmentEntity::class)->createQueryBuilder('AppointmentEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainPaymentEntity::class)->createQueryBuilder('CaptainPaymentEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainProfileEntity::class)->createQueryBuilder('CaptainProfileEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainTermEntity::class)->createQueryBuilder('CaptainTermEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainVacationEntity::class)->createQueryBuilder('CaptainVacationEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(ClientPaymentEntity::class)->createQueryBuilder('ClientPaymentEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(ClientProfileEntity::class)->createQueryBuilder('ClientProfileEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(DeliveryCompanyPackageEntity::class)->createQueryBuilder('DeliveryCompanyPackageEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(DeliveryCompanyProfileEntity::class)->createQueryBuilder('DeliveryCompanyProfileEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(NotificationTokenEntity::class)->createQueryBuilder('OrderDetailEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(OrderDetailEntity::class)->createQueryBuilder('AnnouncementEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(OrderEntity::class)->createQueryBuilder('OrderEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(OrderLogEntity::class)->createQueryBuilder('OrderLogEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(ProductCategoryEntity::class)->createQueryBuilder('ProductCategoryEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(ProductEntity::class)->createQueryBuilder('ProductEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(RatingEntity::class)->createQueryBuilder('RatingEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(RoomIdHelperEntity::class)->createQueryBuilder('RoomIdHelperEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreCategoryEntity::class)->createQueryBuilder('StoreCategoryEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreOwnerBranchEntity::class)->createQueryBuilder('StoreOwnerBranchEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreOwnerPaymentEntity::class)->createQueryBuilder('StoreOwnerPaymentEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreOwnerProfileEntity::class)->createQueryBuilder('StoreOwnerProfileEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreOwnerSubscriptionEntity::class)->createQueryBuilder('StoreOwnerSubscriptionEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreProductCategoryEntity::class)->createQueryBuilder('StoreProductCategoryEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(StoreProductEntity::class)->createQueryBuilder('StoreProductEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(SupportEntity::class)->createQueryBuilder('StoreProductEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(UserEntity::class)->createQueryBuilder('UserEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

           
    //         }
    //         catch (\Exception $ex)
    //         {
    //             return $this->json($ex);
    //         }
    
    //         return $this->response("DELETED", self::DELETE);
    // }
    // /**
    //  * @Route("eraseOrder", name="deleteAllDataOfOrderAndOrderDetail", methods={"DELETE"})
    //  * 
    //  */
    // public function eraseOrder()
    // {
    //     try
    //     {
    //         $em = $this->getDoctrine()->getManager();

    //         $em->getRepository(OrderDetailEntity::class)->createQueryBuilder('AnnouncementEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(OrderEntity::class)->createQueryBuilder('OrderEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(OrderLogEntity::class)->createQueryBuilder('OrderLogEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();
    //         }
    //         catch (\Exception $ex)
    //         {
    //             return $this->json($ex);
    //         }
    
    //         return $this->response("DELETED", self::DELETE);
    // }

    // /**
    //  * @Route("eraseCaptain", name="deleteAllDataOfCaptain", methods={"DELETE"})
    //  * 
    //  */
    // public function eraseCaptainProfile()
    // {
    //     try
    //     {
    //         $em = $this->getDoctrine()->getManager();

    //         $em->getRepository(CaptainPaymentEntity::class)->createQueryBuilder('CaptainPaymentEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainProfileEntity::class)->createQueryBuilder('CaptainProfileEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainTermEntity::class)->createQueryBuilder('CaptainTermEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();

    //         $em->getRepository(CaptainVacationEntity::class)->createQueryBuilder('CaptainVacationEntity')
    //             ->delete()
    //             ->getQuery()
    //             ->execute();
    //         }
    //         catch (\Exception $ex)
    //             {
    //                 return $this->json($ex);
    //             }
        
    //             return $this->response("DELETED", self::DELETE);        
    // }
}
