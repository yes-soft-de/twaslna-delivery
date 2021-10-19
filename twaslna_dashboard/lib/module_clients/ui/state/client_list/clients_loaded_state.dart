import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/captains_routes.dart';
import 'package:twaslna_dashboard/module_clients/clients_routes.dart';
import 'package:twaslna_dashboard/module_clients/model/client_list_model.dart';
import 'package:twaslna_dashboard/module_clients/ui/screen/clients_list_screen.dart';
import 'package:twaslna_dashboard/utils/components/costom_search.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

class ClientsLoadedState extends States {
  final ClientsScreenState screenState;
  final String? error;
  final bool empty;
  final List<ClientsListModel>? model;

  ClientsLoadedState(this.screenState, this.model,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.refresh();
    }
  }

  String? id;
  String? search;

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getClients();
        },
        error: error,
      );
    } else if (empty && search == null) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getClients();
          });
    }
    return FixedContainer(child:CustomListView.custom(children: getClients(context)));
  }

  List<Widget> getClients(BuildContext context) {
    List<Widget> widgets = [];
    for (var element in model ?? <ClientsListModel>[]) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(
            right: 16.0, left: 16.0, bottom: 8.0, top: 8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Navigator.of(context).pushNamed(ClientsRoutes.CLIENT_PROFILE,
                arguments: int.parse(element.id));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, bottom: 8, top: 8),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipOval(
                      // borderRadius: BorderRadius.circular(25),
                      child: CustomNetworkImage(
                        width: 50,
                        height: 50,
                        imageSource: element.image,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    element.clientName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(screenState.context)
                          .backgroundColor
                          .withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }

    if (model != null) {
      widgets.insert(
          0,
          Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 16),
            child: CustomDeliverySearch(
              hintText: S.current.clients,
              onChanged: (s) {
                if (s == '' || s.isEmpty) {
                  search = null;
                  screenState.getClients();
                } else {
                  search = s;
                  screenState.getSearchResult(search!);
                }
              },
            ),));
    }

    return widgets;

  }
}
