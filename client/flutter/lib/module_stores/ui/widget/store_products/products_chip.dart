import 'package:flutter/material.dart';

class ProductsChips extends StatelessWidget {
  final String title;
  final bool active;

  ProductsChips({required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:active ? Theme.of(context).primaryColor : null),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            color:active ? Colors.white : null,
          ),
        ),
      )),
    );
  }
}
