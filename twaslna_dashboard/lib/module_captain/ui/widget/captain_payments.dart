import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_payments/payments_routes.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';
class CaptainCardPayment extends StatelessWidget {
  final String captainId;
  final String image;
  final String captainName;

  CaptainCardPayment({Key? key,required this.captainId,required this.image,required this.captainName,required this.remainingAmountForCaptain});

  final num remainingAmountForCaptain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 8.0,top:8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          Navigator.of(context).pushNamed(PaymentsRoutes.PAYMENTS_TO_CAPTAIN,
              arguments: int.parse(captainId));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, bottom: 8, top: 8),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                    // borderRadius: BorderRadius.circular(25),
                    child: CustomNetworkImage(
                      width: 50,
                      height: 50,
                      imageSource: image ,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  captainName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: remainingAmountForCaptain > 0
                        ? Colors.green
                        : Colors.red),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 16.0, right: 16),
                  child: Text(
                    remainingAmountForCaptain.toString() +
                        ' ' +
                        S.current.sar,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .backgroundColor
                        .withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
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
