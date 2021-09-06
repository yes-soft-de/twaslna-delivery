import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:twaslna_delivery/utils/images/images.dart';

class CustomOrderStatusAppBar extends StatelessWidget {
  final Function(RatingDialogResponse) onRate;
  final bool hide;
  CustomOrderStatusAppBar({required this.onRate,this.hide = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      child: Padding(
        padding:  EdgeInsets.only(left: 16.0, right: 16, top: MediaQuery.of(context).size.height * 0.025,),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child:Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(S.of(context).orderStatus,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),),
              Opacity(
                opacity:hide?0:1,
                child: InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => RatingDialog(
                        enableComment: false,
                        title: S.current.rateStore,
                        message:S.current.rateStoreMessage,
                        image: Image.asset(ImageAsset.LOGO,width: 60,height: 60,),
                        submitButton: S.current.submit,
                        onSubmitted: (response) {
                          onRate(response);
                        },
                      ),
                    );

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
