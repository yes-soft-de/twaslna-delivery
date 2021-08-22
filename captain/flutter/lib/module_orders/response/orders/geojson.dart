class GeoJson {

  double? lat;
  double? long;

  GeoJson({
      this.lat, 
      this.long
  });

  GeoJson.fromJson(dynamic json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    return map;
  }

}