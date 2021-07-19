import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';

class CustomSendItFormField extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final String? hintText;
  final Widget? preIcon;
  final Widget? sufIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final bool numbers;
  @override
  _CustomSendItFormFieldState createState() => _CustomSendItFormFieldState();

  CustomSendItFormField({this.height = 50,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
    this.hintText, this.preIcon, this.sufIcon, this.controller,this.readOnly = false,this.onTap,this.maxLines,this.numbers = false});
}

class _CustomSendItFormFieldState extends State<CustomSendItFormField> {
  AutovalidateMode mode = AutovalidateMode.disabled;
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
        autovalidateMode:mode,
        toolbarOptions: ToolbarOptions(
          copy: true,
          paste: true,
          selectAll: true,
          cut: true
        ),
        onTap:widget.onTap,
        controller:widget.controller,
        readOnly:widget.readOnly,
        maxLines:widget.maxLines,
        keyboardType:widget.numbers?TextInputType.phone:null,
        validator: (value){
          if (mode == AutovalidateMode.disabled){
            setState(() {
              mode = AutovalidateMode.onUserInteraction;
            });
          }
          if (value == null) {
            return S.of(context).pleaseCompleteTheForm;
          } else if (value.isEmpty) {
            return S.of(context).pleaseCompleteTheForm;
          }
          else if (value.length < 8 && widget.numbers) {
            return S.of(context).phoneNumbertooShort;
          }
          else {
            return null;
          }
        },
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
