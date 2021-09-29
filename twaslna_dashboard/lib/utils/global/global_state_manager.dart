import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_captain/state_manager/captain_list.dart';
import 'package:twaslna_dashboard/module_captain/state_manager/in_active_captains_state_manager.dart';

@injectable
class GlobalStateManager {
  final InActiveCaptainsStateManager _inActiveCaptainsStateManager;
  final CaptainsStateManager _captainsStateManager;

  GlobalStateManager(
      this._inActiveCaptainsStateManager, this._captainsStateManager);

  Future<void> updateCaptainList() async{
    print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    bool captainsListRefreshAble = ! await _captainsStateManager.stateStream.isEmpty;
    if (captainsListRefreshAble && _captainsStateManager.state != null){
      _captainsStateManager.getCaptains(_captainsStateManager.state!);
    }
    bool inActiveCaptainListRefreshAble = ! await _inActiveCaptainsStateManager.stateStream.isEmpty;
    if (inActiveCaptainListRefreshAble && _inActiveCaptainsStateManager.state != null) {
      _inActiveCaptainsStateManager.getCaptains(_inActiveCaptainsStateManager.state!);
    }
}
}