class CaptainProfileResponse {
  String? statusCode;
  String? msg;
  Data? data;

  CaptainProfileResponse({
      this.statusCode, 
      this.msg, 
      this.data});

  CaptainProfileResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['msg'] = msg;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  int? id;
  String? captainID;
  String? captainName;
  Location? location;
  int? age;
  String? car;
  String? drivingLicence;
  String? drivingLicenceURL;
  dynamic? salary;
  String? status;
  Rating? rating;
  dynamic? bounce;
  dynamic? roomID;
  String? image;
  String? imageURL;
  String? baseURL;
  String? phone;
  String? isOnline;
  String? bankName;
  String? bankAccountNumber;
  String? stcPay;
  dynamic? vacationStatus;
  String? mechanicLicense;
  String? identity;

  Data({
      this.id, 
      this.captainID, 
      this.captainName, 
      this.location, 
      this.age, 
      this.car, 
      this.drivingLicence, 
      this.drivingLicenceURL, 
      this.salary, 
      this.status, 
      this.rating, 
      this.bounce, 
      this.roomID, 
      this.image, 
      this.imageURL, 
      this.baseURL, 
      this.phone, 
      this.isOnline, 
      this.bankName, 
      this.bankAccountNumber, 
      this.stcPay, 
      this.vacationStatus, 
      this.mechanicLicense, 
      this.identity});

  Data.fromJson(dynamic json) {
    id = json['id'];
    captainID = json['captainID'];
    captainName = json['captainName'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    age = json['age'];
    car = json['car'];
    drivingLicence = json['drivingLicence'];
    drivingLicenceURL = json['drivingLicenceURL'];
    salary = json['salary'];
    status = json['status'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    bounce = json['bounce'];
    roomID = json['roomID'];
    image = json['image'];
    imageURL = json['imageURL'];
    baseURL = json['baseURL'];
    phone = json['phone'];
    isOnline = json['isOnline'];
    bankName = json['bankName'];
    bankAccountNumber = json['bankAccountNumber'];
    stcPay = json['stcPay'];
    vacationStatus = json['vacationStatus'];
    mechanicLicense = json['mechanicLicense'];
    identity = json['identity'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['captainID'] = captainID;
    map['captainName'] = captainName;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['age'] = age;
    map['car'] = car;
    map['drivingLicence'] = drivingLicence;
    map['drivingLicenceURL'] = drivingLicenceURL;
    map['salary'] = salary;
    map['status'] = status;
    if (rating != null) {
      map['rating'] = rating?.toJson();
    }
    map['bounce'] = bounce;
    map['roomID'] = roomID;
    map['image'] = image;
    map['imageURL'] = imageURL;
    map['baseURL'] = baseURL;
    map['phone'] = phone;
    map['isOnline'] = isOnline;
    map['bankName'] = bankName;
    map['bankAccountNumber'] = bankAccountNumber;
    map['stcPay'] = stcPay;
    map['vacationStatus'] = vacationStatus;
    map['mechanicLicense'] = mechanicLicense;
    map['identity'] = identity;
    return map;
  }

}

class Rating {
  dynamic? rate;

  Rating({
      this.rate});

  Rating.fromJson(dynamic json) {
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['rate'] = rate;
    return map;
  }

}

class Location {
  double? lat;
  double? lon;

  Location({
      this.lat, 
      this.lon});

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }

}