class TopWantedProductsModel {
  String title;
  String image;
  double price;
  int id;
  int quantity;
  int ownerId;
  String storeName;
  String storeImage;
  String phone;
  double deliveryCost;

  TopWantedProductsModel(
      {required this.title,
      required this.image,
      required this.price,
      required this.id,
      this.quantity = 0,
      required this.ownerId,
      required this.storeName,
      required this.storeImage,
      required this.phone,
      required this.deliveryCost});
}
