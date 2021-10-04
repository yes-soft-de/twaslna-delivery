
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/module_captain/state_manager/captain_list.dart';
import 'package:twaslna_dashboard/module_captain/state_manager/in_active_captains_state_manager.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captains_list_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/in_active_captains_screen.dart';

@singleton
@injectable
class GlobalStateManager {
  final InActiveCaptainsStateManager _inActiveCaptainsStateManager;
  final CaptainsStateManager _captainsStateManager;
  final PublishSubject _stateSubject = PublishSubject();
  Stream get stateStream => _stateSubject.stream;

  GlobalStateManager(
      this._inActiveCaptainsStateManager, this._captainsStateManager);

  void updateCaptainList() {
    _stateSubject.add(DateTime.now().toString());
  }
}
