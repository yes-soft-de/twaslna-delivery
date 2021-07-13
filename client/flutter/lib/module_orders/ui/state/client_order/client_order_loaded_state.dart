import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/client_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_state.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/client_order/animation_alert.dart';
import 'package:twaslna_delivery/utils/components/make_order_button.dart';

class ClientOrderLoadedState extends ClientOrderState {
  ClientOrderLoadedState(ClientOrderScreenState screenState)
      : super(screenState);
  final _mapController = MapController();
  LatLng? clientAddress;
  bool flagMyPos = true;
  TimeOfDay time = TimeOfDay.now();
  String? payments;
  @override
  Widget getUI(BuildContext context) {
    if (flagMyPos && screenState.myPos != null) {
      clientAddress = screenState.myPos;
      saveMarker(clientAddress!);
      _mapController.move(screenState.myPos!, 17);
      flagMyPos = false;
    }
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.70,
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: screenState.myPos ?? LatLng(21.5429423, 39.1690945),
                    zoom: 17.0,
                    onTap: (newPos) {
                      saveMarker(newPos);
                      screenState.refresh();
                    },
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          'https://mt.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(
                      markers:
                          clientAddress == null ? [] : _getMarkers(context),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 50),
                      child: CustomAnimationAlert()),
                ),
              ],
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(18))),
              child: Stack(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value == null) {
                                } else {
                                  time = value;
                                  screenState.refresh();
                                }
                              });
                            },
                            leading: Icon(
                              Icons.timer,
                            ),
                            title: Text(S.of(context).orderTime),
                            trailing: Text(time.format(context).toString()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Icon(payments != 'cash' ? Icons.payment : FontAwesomeIcons.coins,),
                            title: Text(S.of(context).paymentMethod),
                            trailing: DropdownButton(
                                value: payments,
                                underline: Container(),
                                icon: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.arrow_drop_down_rounded),
                                ),
                                hint: Text(S.of(context).paymentMethodHint),
                                items: [
                                  DropdownMenuItem(
                                    child: Text(S.of(context).card),
                                    value: 'card',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(S.of(context).cash),
                                    value: 'cash',
                                  ),
                                ],
                                onChanged: (payment) {
                                  payments = payment.toString();
                                  screenState.refresh();
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MakeOrderButton(
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  List<Marker> _getMarkers(BuildContext context) {
    if (clientAddress == null) return <Marker>[];
    return [
      Marker(
        point: clientAddress!,
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_pin,
            color: Colors.red,
            size: 35,
          ),
        ),
      )
    ];
  }

  void saveMarker(LatLng location) {
    clientAddress = location;
  }
}
