import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_account/service/account_service.dart';
import 'package:twaslna_delivery/module_account/ui/screen/account_screen.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_loaded_state.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_loading_state.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_state.dart';
import 'package:twaslna_delivery/module_auth/service/auth_service/auth_service.dart';

@injectable
class AccountStateManager {
  final AccountService _accountService;
  final AuthService _authService;
  AccountStateManager(this._accountService,this._authService);
  final PublishSubject<AccountState> _stateSubject =
  PublishSubject<AccountState>();

  Stream<AccountState> get stateStream => _stateSubject.stream;

  void getProfile(AccountScreenState screenState){
    _stateSubject.add(AccountLoadingState(screenState));
       bool signIn = _authService.isLoggedIn;
       if (signIn){
         _stateSubject.add(AccountLoadedState(screenState,signIn:signIn));
       }
       else {
         _stateSubject.add(AccountLoadedState(screenState,signIn:signIn));
       }
  }

}
