import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/client_order/map_client_order.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/send_it_screen.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_finish_order.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/custom_app_bar.dart';

class SendItChooseDestinationState extends SendItState {
  SendItChooseDestinationState(SendItScreenState screenState) : super(screenState);
  final _mapController = MapController();
  LatLng? destinationPoint;
  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar.sendItBar(context, title:S.of(context).chooseDestinationPoint, onTap:(){
        screenState.currentState = SendItFinishOrderState(screenState);
        screenState.refresh();
      }),
      body: Stack(
        children: [
          MapClientOrder(
            _mapController,
            onTap: (value) {
              destinationPoint = value;
              screenState.refresh();
            },
            defaultPoint: screenState.destinationPoint,
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: (){
                  screenState.destinationPoint = destinationPoint;
                  screenState.refresh();
                  screenState.currentState = SendItFinishOrderState(screenState);
                },
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor,
                          spreadRadius: 1.5,
                          blurRadius: 10,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      S.of(context).save,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
