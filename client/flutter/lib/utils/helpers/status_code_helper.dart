import 'package:twaslna_delivery/generated/l10n.dart';

class StatusCodeHelper {
  static String getStatusCodeMessages(int statusCode) {
      switch (statusCode) {
      case 200 :
        return S.current.statusCodeOk;
      case 201:
        return S.current.statusCodeCreated;
      case 400:
        return S.current.statusCodeBadRequest;
      case 401:
        return S.current.statusCodeUnauthorized;
      case 404:
        return S.current.StatusCodeNotFound;
      default:
        return S.current.networkError;
    }
  }
}
