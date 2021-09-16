import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/response/products_category_response.dart';

class ProductsCategoryModel extends DataModel{
  String categoryName  = '';

  int id = -1 ;

  List <ProductsCategoryModel> _model = [];

  ProductsCategoryModel({required this.categoryName,required this.id});

  ProductsCategoryModel.withData(List <Data> data) : super.withData() {
    _model = [];
    for (var element in data) {
      _model.add(ProductsCategoryModel(
        id:element.id ?? -1,
        categoryName: element.productCategoryName ?? S.current.productCategory,
      ));
    }
  }
 List<ProductsCategoryModel> get data => _model;
}