import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_account/manager/account_manager.dart';

@injectable
class AccountService {
  AccountManager _accountManager;
AccountService(this._accountManager);
}
