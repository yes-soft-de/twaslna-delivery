import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_account/repository/account_repository.dart';


@injectable
class AccountManager {
  AccountRepository _accountRepository;
  AccountManager(this._accountRepository);
}
