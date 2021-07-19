import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String? hintText;
  final Widget? preIcon;
  final Widget? sufIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final int? maxLines;
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();

  CustomFormField({this.height = 50,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
    this.hintText, this.preIcon, this.sufIcon, this.controller,this.readOnly = false,this.onTap,this.maxLines});
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        maxLines:widget.maxLines,
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
