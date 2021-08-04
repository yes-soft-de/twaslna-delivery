import 'package:flutter/material.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_account/model/profile_model.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';
import 'package:twaslna_delivery/utils/images/images.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class AccountAppBar extends StatelessWidget {
  final ProfileModel? profileModel;

  AccountAppBar(this.profileModel);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: 25.0, left: 25, top: 16, bottom: 16),
          child: Container(
            width: double.maxFinite,
            child: Text(
              S.of(context).account,
              style: StyleText.appBarHeaderStyle,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 25.0, left: 25, bottom: 16),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).backgroundColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    Urls.IMAGES_ROOT +'${profileModel?.image??''}',
                    fit: BoxFit.cover,
                    errorBuilder: (context,error,t){
                      return Image.asset(ImageAsset.LOGO);
                    },
                  ),
                ),
              ),
              Container(width: 16,),
              Text(profileModel?.name??'${S.of(context).username}',style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
