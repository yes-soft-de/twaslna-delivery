import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_stores/manager/stores_manager.dart';
import 'package:twaslna_dashboard/module_stores/model/stores_model.dart';
import 'package:twaslna_dashboard/module_stores/request/create_store_request.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class StoresService {
  final StoreManager _storeManager;

  StoresService(this._storeManager);

  Future<DataModel> getStores() async {
    StoresResponse? _storesResponse = await _storeManager.getStores();
    if (_storesResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_storesResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_storesResponse.statusCode));
    }
    if (_storesResponse.data == null) return DataModel.empty();
    return StoresModel.withData(_storesResponse.data!);
  }

  Future<DataModel> createStores(CreateStoreRequest request) async {
    ActionResponse? actionResponse = await _storeManager.createStore(request);

    if (actionResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (actionResponse.statusCode != '201') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(actionResponse.statusCode));
    }
    return DataModel.empty();
  }
}
