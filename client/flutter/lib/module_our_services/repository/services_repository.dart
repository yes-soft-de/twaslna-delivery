import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
import 'package:twaslna_delivery/module_our_services/request/private_order_request.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';
import 'package:twaslna_delivery/module_our_services/response/sendItResponse.dart';
@injectable
class ServicesRepository{
  final ApiClient _apiClient;

  ServicesRepository(this._apiClient);
  var fakeToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjcxNTUzNDQsImV4cCI6MTYyNzE2MjU0NCwicm9sZXMiOlsiUk9MRV9DTElFTlQiLCJ1c2VyIl0sInVzZXJuYW1lIjoiY2xpZW50In0.q01qvxY4dJQDim5exjfbr7gJRd2CtaQLoMX4k-LmxnXZ9rQuM0JorjR-sbHmXl_Q31aYophJE3hw53-JZZDrqeZbxe_4Jb3ivjr0kKXp1wjJ-OGzWrHDc6inHxllpegcKvtwBeKWYqBLtyLMngj2DbFInrc7Oji1gwVixDxxJTMQ2FLfQNd1s28DHpj_hj0eHYRLoiI9oGolyRS51SrSTJ1DGgvD5nrEsTrxQq49AUL8jAHYn-AZq8jSR2dASGuodxnpy-vUb0Ec9RCQYVJ0mirTZ5u4ywAsSGtiDGC6ofirdYWNVDiQ3jKO1oWveY0YLU70LeLsc9xHndVBX9XwWA' ;
  Future <int?> sendItClintOrder(SendItRequest request) async {
    var token = fakeToken;
    dynamic response = await  _apiClient.post(Urls.POST_CLIENT_SEND_IT_ORDER_API, request.toJson(),headers: {'Authorization':'Bearer '+token.toString()});
    if (response == null) return null;
    return int.parse(SendItResponse.fromJson(response).statusCode ?? '500');
  }
  Future <int?> postPrivateOrder(PrivateOrderRequest request) async {
    var token = fakeToken;
    dynamic response = await  _apiClient.post(Urls.POST_CLIENT_PRIVATE_ORDER_API, request.toJson(),headers: {'Authorization':'Bearer '+token.toString()});
    if (response == null) return null;
    return int.parse(SendItResponse.fromJson(response).statusCode ?? '500');
  }
}