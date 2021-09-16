import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_categories/repository/categories_repository.dart';
import 'package:twaslna_dashboard/module_categories/request/create_store_category_request.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_categories/response/store_categories_response.dart';
import 'package:twaslna_dashboard/module_main/repository/home_repository.dart';
import 'package:twaslna_dashboard/module_main/response/report_response.dart';
import 'package:twaslna_dashboard/module_stores/repository/stores_repository.dart';
import 'package:twaslna_dashboard/module_stores/request/create_store_request.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';

@injectable
class HomeManager {

  final HomeRepository _homeRepository;

  HomeManager(this._homeRepository);

  Future<ReportResponse?> getReport() => _homeRepository.getReport();


}
