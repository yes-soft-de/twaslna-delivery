import 'package:flutter/material.dart';
class OrderChip extends StatefulWidget {
  final String title;
  final String image;
  final price;
  final String currency;
  final Function(int,double,String?,String?,int) quantity;
  final int defaultQuantity;
  final bool editable;
  final int productID;
  OrderChip({
    required this.title,required this.productID,required this.image,required this.price,this.currency = 'SAR',required this.quantity,this.defaultQuantity = 0,this.editable = true});
  @override
  _OrderChipState createState() => _OrderChipState();
}

class _OrderChipState extends State<OrderChip> {
  late int quantity ;
  String? name;
  String? image;
  double? price;
  int? id;
  @override
  void initState() {
    super.initState();
    quantity = widget.defaultQuantity;
    name = widget.title;
    image = widget.image;
    price = widget.price;
    id = widget.productID;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      child:Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    image??widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('${price??widget.price} ${widget.currency}',style: TextStyle(
                    fontWeight: FontWeight.w600,
                ),overflow: TextOverflow.ellipsis,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(name??widget.title,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),overflow: TextOverflow.ellipsis,),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(10),
                      color:
                      Theme.of(context).backgroundColor,
                    ),
                    child:widget.editable?Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Localizations.localeOf(context)
                                        .languageCode ==
                                        'en'
                                        ? Radius.circular(10)
                                        : Radius.zero,
                                    right: Localizations.localeOf(context)
                                        .languageCode ==
                                        'en'
                                        ? Radius.zero
                                        : Radius.circular(10)),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (quantity > 0) {
                              quantity = quantity - 1 ;
                              setState(() {
                                widget.quantity(quantity,price??widget.price,name,image,id??widget.productID);
                              });
                            }
                          },
                          child: Icon(Icons.remove),
                        ),
                        Text(quantity.toString()),
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left:Localizations.localeOf(context).languageCode == 'en' ? Radius.zero : Radius.circular(10),
                                    right:Localizations.localeOf(context).languageCode == 'en' ? Radius.circular(10) : Radius.zero ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            quantity = quantity + 1 ;
                            setState(() {
                              widget.quantity(quantity,price??widget.price,name,image,id??widget.productID);
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ):Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right:16,left: 16),
                        child: Text(quantity.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

