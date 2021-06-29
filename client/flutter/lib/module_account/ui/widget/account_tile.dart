import 'package:flutter/material.dart';
class AccountTile extends StatelessWidget {
  final String text;
  final IconData icon;
  AccountTile({required this.text,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,left: 8.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon,
                color: Theme.of(context).backgroundColor),
          ),
        ),
        title: Text(text),
        trailing: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).backgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward_rounded,
            ),
          ),
        ),
      ),
    );
  }
}
