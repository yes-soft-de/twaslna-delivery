class StoreModel {
  int id;
  String storeOwnerName;
  String? image;
  dynamic phone;
  dynamic location;

  StoreModel({
      required this.id, required this.storeOwnerName,this.image, this.phone, this.location});
}