import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/consts/order_status.dart';
import 'package:twaslna_delivery/generated/l10n.dart';

class StatusHelper {
  static OrderStatus getStatusEnum(String? status) {
    if (status == 'pending') {
      return OrderStatus.WAITING;
    } else if (status == 'on way to pick order') {
      return OrderStatus.GOT_CAPTAIN;
    } else if (status == 'in store') {
      return OrderStatus.IN_STORE;
    } else if (status == 'ongoing') {
      return OrderStatus.DELIVERING;
    } else if (status == 'delivered') {
      return OrderStatus.FINISHED;
    }
    return OrderStatus.WAITING;
  }
  static String getStatusString(OrderStatus status) {
    switch (status) {
      case OrderStatus.WAITING:
        return 'waiting';
      case OrderStatus.IN_STORE:
        return 'in store';
      case OrderStatus.DELIVERING:
        return 'delivering';
      case OrderStatus.GOT_CAPTAIN:
        return 'got captain';
      case OrderStatus.FINISHED:
        return 'finish';
      default:
        return 'waiting';
    }
  }
  static String getOrderStatusMessages(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.WAITING:
        return S.current.waiting;
      case OrderStatus.IN_STORE:
        return S.current.captainInStore;
      case OrderStatus.DELIVERING:
        return S.current.captainIsDelivering;
      case OrderStatus.GOT_CAPTAIN:
        return S.current.captainAcceptedOrder;
      case OrderStatus.FINISHED:
        return S.current.iFinishedDelivering;
      default:
        return S.current.waiting;
    }
  }
  static String getOrderStatusDescriptionMessages(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.WAITING:
        return S.current.waitingDescription;
      case OrderStatus.IN_STORE:
        return S.current.captainInStoreDescription;
      case OrderStatus.DELIVERING:
        return S.current.deliveringDescription;
      case OrderStatus.GOT_CAPTAIN:
        return S.current.captainAcceptOrderDescription;
      case OrderStatus.FINISHED:
        return S.current.orderDeliveredDescription;
      default:
        return S.current.waitingDescription;
    }
  }
  static IconData getOrderStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.WAITING:
        return Icons.timer;
      case OrderStatus.IN_STORE:
        return Icons.store;
      case OrderStatus.DELIVERING:
        return Icons.pedal_bike_rounded;
      case OrderStatus.GOT_CAPTAIN:
        return Icons.account_circle_rounded;
      case OrderStatus.FINISHED:
        return Icons.check_circle;
      default:
        return Icons.timer;
    }
  }
  static int getOrderStatusIndex(OrderStatus status) {
    switch (status) {
      case OrderStatus.WAITING:
        return 0;
      case OrderStatus.IN_STORE:
        return 2;
      case OrderStatus.DELIVERING:
        return 3;
      case OrderStatus.GOT_CAPTAIN:
        return 1;
      case OrderStatus.FINISHED:
        return 4;
      default:
        return 0;
    }
  }
}