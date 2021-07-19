class StoreModel {
  int id;
  String storeOwnerName;
  String image;
  dynamic phone;
  dynamic location;
  double deliveryCost;
  StoreModel({required this.deliveryCost,
      required this.id, required this.storeOwnerName,required this.image, this.phone, this.location});
}