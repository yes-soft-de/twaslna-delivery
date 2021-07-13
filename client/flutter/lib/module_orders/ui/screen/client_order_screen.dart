import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_state.dart';

@injectable
class ClientOrderScreen extends StatefulWidget {
  @override
  ClientOrderScreenState createState() => ClientOrderScreenState();
}

class ClientOrderScreenState extends State<ClientOrderScreen> {
  late ClientOrderState currentState;
  LatLng? myPos;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = ClientOrderLoadedState(this);
    defaultLocation().then((value){
      if (value == null) {
      }
      else {
        myPos = value;
        if (mounted){
          setState(() {
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var focus = FocusScope.of(context);
          if (focus.canRequestFocus) {
            focus.unfocus();
          }
        },
        child: Scaffold(
          body: currentState.getUI(context),
        )
    );
  }
  Future<LatLng?> defaultLocation() async{
    Location location = new Location();

    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    var _permissionGranted =
    await location.requestPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      return null;
    }

    var myLocation = await Location.instance.getLocation();
    LatLng myPos =
    LatLng(myLocation.latitude??0, myLocation.longitude??0);
    return myPos;
  }
}
