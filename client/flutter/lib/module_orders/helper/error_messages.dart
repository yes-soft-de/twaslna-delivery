import 'package:twaslna_delivery/generated/l10n.dart';

class ErrorMessages {
  static String getMessage(String err){
    if (err == 'order Number not found!!'){
      return S.current.orderNumberNotFound;
    }
    else if (err == 'can not remove it, Exceeded time allowed') {
    return S.current.exceededAllowedTime;
    }
    else if (err == 'can not remove it, The captain received the order') {
      return S.current.notAllowedCaptainReceived;
    }
    else {
      return S.current.errorHappened;
    }
  }
}