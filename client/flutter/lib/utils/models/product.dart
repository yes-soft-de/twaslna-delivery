class ProductModel {
  String title;
  String image;
  int price;
  int id;
  int quantity;
  ProductModel({required this.title,required this.image,required this.price,required this.id,this.quantity = 0});
}