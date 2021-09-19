import 'package:twaslna_dashboard/utils/logger/logger.dart';

class CaptainAccountBalanceResponse {
  String? statusCode;
  String? msg;
  List<Data>? data;

  CaptainAccountBalanceResponse({this.statusCode, this.msg, this.data});

  CaptainAccountBalanceResponse.fromJson(dynamic json) {
    try {
      statusCode = json['status_code'];
      msg = json['msg'];
      if (json['Data'] != null) {
        data = [];
        json['Data'].forEach((v) {
          data?.add(Data.fromJson(v));
        });
      }
    } catch(e) {
      Logger().error('Captain Account Response',e.toString(), StackTrace.current);
      statusCode = '-1';
    }

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['msg'] = msg;
    if (data != null) {
      map['Data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  num? sumPaymentsToCaptain;
  num? sumPaymentsFromCaptain;
  num? countOrdersDelivered;
  num? sumInvoiceAmount;
  num? deliveryCost;
  num? amountWithCaptain;
  num? remainingAmountForCompany;
  num? bounce;
  num? kilometerBonus;
  num? salary;
  num? netProfit;
  num? total;
  List<dynamic>? paymentsToCaptain;
  List<dynamic>? paymentsFromCaptain;

  Data(
      {this.sumPaymentsToCaptain,
      this.sumPaymentsFromCaptain,
      this.countOrdersDelivered,
      this.sumInvoiceAmount,
      this.deliveryCost,
      this.amountWithCaptain,
      this.remainingAmountForCompany,
      this.bounce,
      this.kilometerBonus,
      this.salary,
      this.netProfit,
      this.total,
      this.paymentsToCaptain,
      this.paymentsFromCaptain});

  Data.fromJson(dynamic json) {
    sumPaymentsToCaptain = json['sumPaymentsToCaptain'];
    sumPaymentsFromCaptain = json['sumPaymentsFromCaptain'];
    countOrdersDelivered = json['countOrdersDelivered'];
    sumInvoiceAmount = json['sumInvoiceAmount'];
    deliveryCost = json['deliveryCost'];
    amountWithCaptain = json['amountWithCaptain'];
    remainingAmountForCompany = json['remainingAmountForCompany'];
    bounce = json['bounce'];
    kilometerBonus = json['kilometerBonus'];
    salary = json['salary'];
    netProfit = json['NetProfit'];
    total = json['total'];
    if (json['paymentsToCaptain'] != null) {
      paymentsToCaptain = [];
      json['paymentsToCaptain'].forEach((v) {
        //paymentsToCaptain?.add(dynamic.fromJson(v));
      });
    }
    if (json['paymentsFromCaptain'] != null) {
      paymentsFromCaptain = [];
      json['paymentsFromCaptain'].forEach((v) {
        //  paymentsFromCaptain?.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['sumPaymentsToCaptain'] = sumPaymentsToCaptain;
    map['sumPaymentsFromCaptain'] = sumPaymentsFromCaptain;
    map['countOrdersDelivered'] = countOrdersDelivered;
    map['sumInvoiceAmount'] = sumInvoiceAmount;
    map['deliveryCost'] = deliveryCost;
    map['amountWithCaptain'] = amountWithCaptain;
    map['remainingAmountForCompany'] = remainingAmountForCompany;
    map['bounce'] = bounce;
    map['kilometerBonus'] = kilometerBonus;
    map['salary'] = salary;
    map['NetProfit'] = netProfit;
    map['total'] = total;
    if (paymentsToCaptain != null) {
      map['paymentsToCaptain'] =
          paymentsToCaptain?.map((v) => v.toJson()).toList();
    }
    if (paymentsFromCaptain != null) {
      map['paymentsFromCaptain'] =
          paymentsFromCaptain?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
