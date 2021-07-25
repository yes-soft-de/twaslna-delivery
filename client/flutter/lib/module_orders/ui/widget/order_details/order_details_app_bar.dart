import 'package:flutter/material.dart';

class CustomOrderDetailsAppBar extends StatelessWidget {
  final GestureTapCallback? editTap;
  final GestureTapCallback? deleteTap;

  CustomOrderDetailsAppBar({this.editTap, this.deleteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 25),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1,),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap:deleteTap ?? (){},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(width: 16,),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap:editTap ?? () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
