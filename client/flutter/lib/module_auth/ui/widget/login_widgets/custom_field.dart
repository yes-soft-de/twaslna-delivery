import 'package:flutter/material.dart';

class CustomLoginFormField extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String? hintText;
  final Widget? preIcon;
  final Widget? sufIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
  @override
  _CustomLoginFormFieldState createState() => _CustomLoginFormFieldState();

  CustomLoginFormField({this.height = 50,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
     this.hintText, this.preIcon, this.sufIcon, this.controller,this.readOnly = false,this.onTap});
}

class _CustomLoginFormFieldState extends State<CustomLoginFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme
            .of(context)
            .backgroundColor,
      ),
      child: TextFormField(
        onTap:widget.onTap,
        controller:widget.controller,
        readOnly:widget.readOnly,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixIcon: widget.preIcon,
          suffixIcon: widget.sufIcon,
          enabledBorder: InputBorder.none,
          contentPadding: widget.contentPadding,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
