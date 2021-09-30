import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/di/di_config.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_captain/service/captains_service.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captain_profile_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/state/captain_profile/captain_profile.dart';
import 'package:twaslna_dashboard/utils/global/global_state_manager.dart';
import 'package:twaslna_dashboard/utils/helpers/custom_flushbar.dart';


@injectable
class CaptainProfileStateManager {
  final CaptainsService _captainsService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  CaptainProfileStateManager(this._captainsService);

  void getCaptainProfile(CaptainProfileScreenState screenState,int captainId){
    _stateSubject.add(LoadingState(screenState));
    _captainsService.getCaptainProfile(captainId).then((value){
      if (value.hasError){
        _stateSubject.add(CaptainProfileLoadedState(screenState,null,error: value.error));
      }
      else if (value.isEmpty) {
        _stateSubject.add(CaptainProfileLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        ProfileModel _model = value as ProfileModel;
        _stateSubject.add(CaptainProfileLoadedState(screenState,_model.data));
      }
    });
  }

  void acceptCaptainProfile(CaptainProfileScreenState screenState,int captainId , AcceptCaptainRequest request) {
    _stateSubject.add(LoadingState(screenState));
    _captainsService.enableCaptain(request).then((value){
      if (value.hasError){
        CustomFlushBarHelper.createError(title: S.current.warnning, message:value.error.toString()).show(screenState.context);
        getCaptainProfile(screenState, captainId);
        getIt<GlobalStateManager>().updateCaptainList();
      }
      else {
        getCaptainProfile(screenState, captainId);
        CustomFlushBarHelper.createSuccess(title: S.current.warnning, message:S.current.captainActivated).show(screenState.context);
      }
    });
  }

}
