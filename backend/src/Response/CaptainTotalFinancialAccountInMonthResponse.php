<?php

namespace App\Response;

class CaptainTotalFinancialAccountInMonthResponse
{
    public $sumPaymentsFromCompany;

    public $sumPaymentsToCompany;

    public $countOrdersDelivered;

    public $sumInvoiceAmount;
 
    public $deliveryCost;

    public $payments;

    public $amountYouOwn;

    public $remainingAmountForCompany;//مستحقات الشركة

    public $bounce;

    public $NetProfit;

    public $total;

}
