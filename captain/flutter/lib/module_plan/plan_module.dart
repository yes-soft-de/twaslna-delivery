
import 'package:injectable/injectable.dart';
import 'package:twaslna_captain/abstracts/module/yes_module.dart';
import 'package:twaslna_captain/module_plan/plan_routes.dart';
import 'package:twaslna_captain/module_plan/ui/screen/plan_screen.dart';
@injectable
class PlanModule extends YesModule {
  final PlanScreen _planScreen;
  PlanModule(this._planScreen) {
    YesModule.RoutesMap.addAll({
      PlanRoutes.PLAN_ROUTE: (context) => _planScreen,
    });
  }
}