import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/service/home_service.dart';
import 'package:twaslna_delivery/module_home/ui/screen/home_screen.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_error_state.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_loaded_state.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_loading_state.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_state.dart';
import 'package:twaslna_delivery/utils/models/product.dart';

@injectable
class HomeStateManager {
  HomeService _homeService;
  HomeStateManager(this._homeService);
  final PublishSubject<HomeState> _stateSubject = PublishSubject();
  Stream<HomeState> get stateStream => _stateSubject.stream;

  void getHomeData(HomeScreenState screenState) {
    _stateSubject.add(HomeLoadingState(screenState));
    _homeService.getHomeData().then((value) {
      if (value == null) {
        _stateSubject.add(HomeErrorState(screenState,S.current.networkError));
      }
      else {
        _stateSubject.add(HomeLoadedState(screenState, value[0],value[1]));
      }
    });
  }

}
