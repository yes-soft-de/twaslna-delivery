import 'package:dotted_line/dotted_line.dart';
import 'package:twaslna_delivery/consts/order_status.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/ui/widget/show_all.dart';
import 'package:twaslna_delivery/module_orders/orders_routes.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/bill.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_chip.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_details_app_bar.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_details_title_bar.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/custom_stores_products_app_bar.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/store_products_title_bar.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/components/custom_list_tile.dart';
import 'package:twaslna_delivery/utils/customIcon/custom_icons.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class OrderDetailsLoadedState extends OrderDetailsState {
  OrderDetailsScreenState screenState;

  OrderDetailsLoadedState(this.screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          'https://www.gannett-cdn.com/media/2020/03/23/USATODAY/usatsports/247WallSt.com-247WS-657876-imageforentry9-vp7.jpg?width=660&height=371&fit=crop&format=pjpg&auto=webp',
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        CustomOrderDetailsAppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 28.0, left: 28, bottom: 16),
                child: OrderDetailsTitleBar(
                  title: 'store',
                  rate: 4.7,
                ),
              ),
              Container(
                height: height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  color: Theme.of(context).cardColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12.0,
                                left: 12.0,
                                bottom: 25.0,
                                top: 25.0),
                            child: Text(
                              '${S.of(context).orderDetails} #1',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor
                              ),
                              child: ListTile(
                                onTap: (){
                                  Navigator.of(context).pushNamed(OrdersRoutes.ORDER_STATUS);
                                },
                                title:Text(
                                  S.of(context).orderStatus,
                                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                                ),
                                subtitle:Text(
                                  StatusHelper.getOrderStatusMessages(OrderStatus.WAITING),
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                leading:Icon(
                                  StatusHelper.getOrderStatusIcon(OrderStatus.WAITING),color: Colors.white,
                                  size: 35,
                                ),
                                trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 16),
                            child: ListTile(leading: Icon(Icons.shopping_cart_rounded,color: Theme.of(context).disabledColor,size: 25,),
                              title: Text(S.of(context).orderList,style:TextStyle(
                               fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),),
                            ),
                          ),
                          ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                if (index % 2 != 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0),
                                    child: DottedLine(
                                      dashColor:
                                          Theme.of(context).backgroundColor,
                                      lineThickness: 2.5,
                                      dashLength: 6,
                                    ),
                                  );
                                }
                                return OrderChip(
                                  title: 'title',
                                  image:
                                      'https://assets.bonappetit.com/photos/5952b45c76350d51feba80c4/master/pass/Classic%20Burger.JPG',
                                  price: 150,
                                  quantity: (q) {},
                                  editable: true,
                                );
                              }),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: BillCard(),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
