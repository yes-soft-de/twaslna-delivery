import 'package:flutter/material.dart';
import 'package:twaslna_delivery/hive/objects/cart_model/cart_model.dart';
import 'package:twaslna_delivery/utils/components/progresive_image.dart';

class ProductsCard extends StatefulWidget {
  final String title;
  final String image;
  final price;
  final String currency;
  final Function(CartModel) quantity;
  final int defaultQuantity;
  final id;
  ProductsCard(
      {required this.title,
      required this.image,
      required this.price,
      this.currency = 'SAR',
      required this.quantity,
      this.defaultQuantity = 0,
      required this.id
      });

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  late CartModel cartModel;
  @override
  void initState() {
    super.initState();
    cartModel = CartModel(id: widget.id, quantity: widget.defaultQuantity, price: widget.price,name: widget.title,image: widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).backgroundColor,
                spreadRadius: 7,
                blurRadius: 4,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ]),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    height: 100,
                    child: CustomNetworkImage(
                      image:cartModel.image??widget.image,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '${widget.price} ${widget.currency}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Localizations.localeOf(context)
                                                .languageCode ==
                                            'en'
                                        ? Radius.circular(25)
                                        : Radius.zero,
                                    right: Localizations.localeOf(context)
                                                .languageCode ==
                                            'en'
                                        ? Radius.zero
                                        : Radius.circular(25)),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (cartModel.quantity > 0) {
                              cartModel.quantity = cartModel.quantity - 1;
                              setState(() {
                                widget.quantity(cartModel);
                              });
                            }
                          },
                          child: Icon(Icons.remove),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(cartModel.quantity.toString()),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left:Localizations.localeOf(context).languageCode == 'en' ? Radius.zero : Radius.circular(25),
                                    right:Localizations.localeOf(context).languageCode == 'en' ? Radius.circular(25) : Radius.zero ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            cartModel.quantity = cartModel.quantity + 1;
                            setState(() {
                              widget.quantity(cartModel);
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
