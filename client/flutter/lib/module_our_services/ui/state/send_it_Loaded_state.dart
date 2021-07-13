import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/send_it_screen.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/custom_field_send_it.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/label_text.dart';
import 'package:twaslna_delivery/utils/components/make_order_button.dart';

class SendItLoadedState extends SendItState {
  SendItLoadedState(SendItScreenState screenState) : super(screenState);
  String? payments = '';
  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: 25,),
            ListTile(
              title: LabelText(S.of(context).orderDetails),
              subtitle: CustomSendItFormField(maxLines: 7,hintText: S.of(context).orderDetailHint,),
            ),
            SizedBox(height: 16,),
            ListTile(
              title: LabelText(S.of(context).destinationAddress),
              subtitle: CustomSendItFormField(hintText:S.of(context).destinationAddressHint,),
            ),
            SizedBox(height: 16,),
            ListTile(
              title: LabelText(S.of(context).myAddress),
              subtitle: CustomSendItFormField(hintText: S.of(context).myAddressHint,),
            ),
            SizedBox(height: 16,),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).paymentMethod,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle:Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: RadioListTile(
                        title: Text(S.of(context).card),
                        value:'card',
                        groupValue:payments,
                        onChanged: (String? value){
                          payments = value;
                          screenState.refresh();
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: RadioListTile(
                        title: Text(S.of(context).cash),
                        value:'cash',
                        groupValue:payments,
                        onChanged: (String? value){
                          payments = value;
                          screenState.refresh();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:MakeOrderButton(
              onPressed: (){},
          ),
        ),
      ],
    );
  }
}
