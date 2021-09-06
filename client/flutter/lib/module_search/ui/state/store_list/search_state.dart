
import 'package:flutter/cupertino.dart';
import 'package:twaslna_delivery/module_home/ui/screen/home_screen.dart';
import 'package:twaslna_delivery/module_search/ui/screen/search_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_list_screen.dart';

abstract class SearchState {
  final SearchScreenState storeListScreenState;
  SearchState(this.storeListScreenState);
  Widget getUI(BuildContext context);
}