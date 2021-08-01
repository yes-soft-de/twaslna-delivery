
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinksService {
  static Future<LatLng?> checkForGeoLink() async {
    var uri = await getInitialUri();

    if (uri == null) {
      return null;
    }
    if (uri.queryParameters['q'] == null) {
      return null;
    }

    return LatLng(
      double.parse(uri.queryParameters['q']!.split(',')[0]),
      double.parse(uri.queryParameters['q']!.split(',')[1]),
    );
  }

  static Future<LatLng?> defaultLocation() async {
    Location location = new Location();

    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    var _permissionGranted = await location.requestPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      return null;
    }

    var myLocation = await Location.instance.getLocation();
    LatLng myPos = LatLng(myLocation.latitude ?? 0, myLocation.longitude ?? 0);
    return myPos;
  }
}
