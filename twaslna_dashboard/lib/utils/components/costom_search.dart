import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';

class CustomDeliverySearch extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final ValueChanged<String>? onChanged;
  @override
  _CustomDeliverySearchState createState() => _CustomDeliverySearchState();

  CustomDeliverySearch(
      {this.height = 50,
      this.contentPadding = const EdgeInsets.fromLTRB(0, 13.5, 0, 0),
      required this.hintText,
      this.onChanged
      });
}

class _CustomDeliverySearchState extends State<CustomDeliverySearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).backgroundColor,
      ),
      child: TextField(
        onChanged:widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list),
          enabledBorder: InputBorder.none,
          contentPadding: widget.contentPadding,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
