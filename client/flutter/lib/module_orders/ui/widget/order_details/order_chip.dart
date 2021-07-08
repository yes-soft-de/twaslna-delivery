import 'package:flutter/material.dart';
class OrderChip extends StatefulWidget {
  final String title;
  final String image;
  final price;
  final String currency;
  final Function(int) quantity;
  final int defaultQuantity;
  final bool editable;
  OrderChip({
    required this.title,required this.image,required this.price,this.currency = 'SAR',required this.quantity,this.defaultQuantity = 0,this.editable = true});
  @override
  _OrderChipState createState() => _OrderChipState();
}

class _OrderChipState extends State<OrderChip> {
  late int quantity ;

  @override
  void initState() {
    super.initState();
    quantity = widget.defaultQuantity;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.maxFinite,
        height: 100,
        child:Flex(
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('${widget.price} ${widget.currency}',style: TextStyle(
                      fontWeight: FontWeight.w600
                  ),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.title,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                    ),),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        color:
                        Theme.of(context).backgroundColor,
                      ),
                      child:widget.editable?Row(
                        children: [
                         TextButton(
                            style: ButtonStyle(
                              shape:
                              MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.horizontal(
                                      left:
                                      Radius.circular(
                                          10),
                                      right: Radius.zero),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (quantity > 0) {
                                quantity = quantity - 1 ;
                                setState(() {
                                  widget.quantity(quantity);
                                });
                              }
                            },
                            child: Icon(Icons.remove),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.0),
                            child: Text(quantity.toString()),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              shape:
                              MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.horizontal(
                                      left: Radius.zero,
                                      right:
                                      Radius.circular(
                                          10)),
                                ),
                              ),
                            ),
                            onPressed: () {
                              quantity = quantity + 1 ;
                              setState(() {
                                widget.quantity(quantity);
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
      ),
    );
  }
}

