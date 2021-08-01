import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/send_it_screen.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_states/send_it_finish_order.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_states/send_it_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/custom_field_send_it.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/label_text.dart';
import 'package:twaslna_delivery/utils/components/make_order_button.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';

class SendItLoadedState extends SendItState {
  SendItLoadedState(SendItScreenState screenState) : super(screenState);
  String? payments;
  ScrollController scrollController = ScrollController();
  TextEditingController orderDetailsController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController receiptNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _sendIt = GlobalKey<FormState>();
  @override
  Widget getUI(BuildContext context) {
    return Form(
      key: _sendIt,
      child: Stack(
        children: [
          ListView(
            controller: scrollController,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: 25,),
              ListTile(
                title: LabelText(S.of(context).orderDetails),
                subtitle: CustomSendItFormField(maxLines: 7,hintText: S.of(context).orderDetailHint,controller: orderDetailsController,),
              ),
              SizedBox(height: 16,),
              ListTile(
                title: LabelText(S.of(context).note),
                subtitle: CustomSendItFormField(maxLines: 7,hintText: S.of(context).note,controller: noteController,),
              ),
              SizedBox(height: 16,),
              ListTile(
                title: LabelText(S.of(context).recipientName),
                subtitle: CustomSendItFormField(hintText: S.of(context).nameHint,onTap: (){
                  scrollController.animateTo(388,duration: Duration(milliseconds: 400),curve: Curves.linear);
                },controller: receiptNameController,),
              ),
              SizedBox(height: 16,),
              ListTile(
                title: LabelText(S.of(context).recipientPhoneNumber),
                subtitle: CustomSendItFormField(hintText: S.of(context).pleaseInputPhoneNumber,numbers:true,onTap: (){
                  scrollController.animateTo(450,duration: Duration(milliseconds: 500),curve: Curves.linear,);
                },controller: phoneNumberController,maxLines: 1,),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
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
              SizedBox(height: 100,),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:MakeOrderButton(
                onPressed: (){
                  if (_sendIt.currentState!.validate()  && payments != null) {
                    var request = SendItRequest(
                      recipientName: receiptNameController.text,
                      recipientPhone: phoneNumberController.text,
                      detail: orderDetailsController.text,
                      note: noteController.text,
                      payment: payments
                    );
                    screenState.request = request;
                    screenState.currentState = SendItFinishOrderState(screenState);
                    screenState.refresh();
                  }
                  else if (payments == null){
                    CustomFlushBarHelper.createError(title:S.of(context).warnning, message:S.of(context).pleaseProvidePaymentMethode)..show(context);
                  }
                },
                text: S.of(context).createNewOrder,
            ),
          ),
        ],
      ),
    );
  }
}
