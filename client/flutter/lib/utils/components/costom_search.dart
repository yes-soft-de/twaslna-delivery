import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';

class CustomDeliverySearch extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool autoFocus;
  final VoidCallback? onTap;
  final Color? background;
  @override
  _CustomDeliverySearchState createState() => _CustomDeliverySearchState();

  CustomDeliverySearch(
      {this.height = 50,
        this.controller,
      this.contentPadding = const EdgeInsets.fromLTRB(0, 13.5, 0, 0),
      required this.hintText,this.onChanged,this.readOnly = false,this.onTap,this.autoFocus = false,this.background});
}

class _CustomDeliverySearchState extends State<CustomDeliverySearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:widget.background != null  ? widget.background! : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: TextField(
        controller: widget.controller,
        autofocus: widget.autoFocus,
        onChanged:widget.onChanged,
        readOnly:widget.readOnly,
        onTap: widget.onTap,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:widget.hintText,
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
