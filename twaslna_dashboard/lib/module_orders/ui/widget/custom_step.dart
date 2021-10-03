import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/consts/order_status.dart';
import 'package:twaslna_dashboard/utils/helpers/order_status_helper.dart';

class CustomStep extends StatelessWidget {
  final OrderStatusEnum status;
  final int currentIndex;
  final String? date;
  CustomStep({required this.status,required this.currentIndex,this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex >= StatusHelper.getOrderStatusIndex(status) ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(StatusHelper.getOrderStatusIcon(status),size:30,color: Colors.white),
        ) ,
      ),
      title: Text(StatusHelper.getOrderStatusMessages(status),style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),
      subtitle:Text(StatusHelper.getOrderStatusDescriptionMessages(status),style: TextStyle(fontWeight: FontWeight.w600),),
      trailing:Text(date ?? ''),
    );
  }
}