import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_account/service/account_service.dart';
@injectable
class AccountStateManager {
  AccountService _accountService;
  AccountStateManager(this._accountService);
}
