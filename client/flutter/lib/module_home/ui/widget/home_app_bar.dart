import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: 250,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 75),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 225,
                height: 225,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16, left: 25, right: 25),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[900]
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:S.of(context).searchFor,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list),
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(0, 13.5, 0, 0),
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
