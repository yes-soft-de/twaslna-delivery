import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_account_balance_response.dart';

class BalanceModel extends DataModel{

  AccountBalance? _models;
  BalanceModel();

  BalanceModel.withData(Data data) {
    _models = AccountBalance(
      sumPaymentsFromCaptain: data.sumPaymentsFromCaptain ?? 0,
      sumPaymentsToCaptain: data.sumPaymentsToCaptain ?? 0,
      countOrdersDelivered: data.countOrdersDelivered ?? 0,
      sumInvoiceAmount: data.sumInvoiceAmount ?? 0,
      deliveryCost: data.deliveryCost ?? 0,
      amountYouOwn: data.amountWithCaptain ?? 0,
      remainingAmountForCompany: data.remainingAmountForCompany ?? 0,
      salary: data.salary ?? 0,
      bounce: data.bounce ?? 0,
      kilometerBonus: data.kilometerBonus ?? 0,
      netProfit: data.netProfit ?? 0,
      total: data.total ?? 0,
    );
  }

  AccountBalance? get data {
    return _models;
  }

}

class PaymentModel {
  DateTime paymentDate;
  var amount;

  PaymentModel(this.paymentDate, this.amount);
}

class AccountBalance extends BalanceModel {
  num sumPaymentsFromCaptain;
  num sumPaymentsToCaptain;
  num countOrdersDelivered;
  num sumInvoiceAmount;
  num deliveryCost;
  num amountYouOwn;
  num remainingAmountForCompany;
  num salary;
  num bounce;
  num kilometerBonus;
  num netProfit;
  num total;

  AccountBalance(
      {required this.sumPaymentsFromCaptain,
        required this.sumPaymentsToCaptain,
        required this.countOrdersDelivered,
        required this.sumInvoiceAmount,
        required this.deliveryCost,
        required this.amountYouOwn,
        required this.remainingAmountForCompany,
        required this.salary,
        required this.bounce,
        required this.kilometerBonus,
        required this.netProfit,
        required this.total});

  AccountBalance.none({
    this.sumPaymentsFromCaptain = 0,
    this.sumPaymentsToCaptain = 0,
    this.countOrdersDelivered = 0,
    this.sumInvoiceAmount = 0,
    this.deliveryCost = 0,
    this.amountYouOwn = 0,
    this.remainingAmountForCompany = 0,
    this.salary = 0,
    this.bounce = 0,
    this.kilometerBonus = 0,
    this.netProfit = 0,
    this.total = 0}) : super();
}
