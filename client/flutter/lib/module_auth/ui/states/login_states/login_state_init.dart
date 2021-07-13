import 'package:flutter_svg/flutter_svg.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_account/ui/widget/custom_field.dart';
import 'package:twaslna_delivery/module_auth/authorization_routes.dart';
import 'package:twaslna_delivery/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:twaslna_delivery/module_auth/ui/states/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/login_widgets/login_app_bar.dart';
import 'package:twaslna_delivery/utils/images/images.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class LoginStateInit extends LoginState {
  LoginStateInit(LoginScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Form(
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          CustomLoginAppBar(),
         MediaQuery.of(context).viewInsets.bottom == 0 ? SvgPicture.asset(ImageAsset.AUTH_SVG,width: 150,):Container(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0,left: 85,right: 85,top: 8),
            child: Text(S.of(context).email,style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.email),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomLoginFormField(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0,left: 85,right: 85,top: 8),
            child: Text(S.of(context).password,style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.lock),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormField(),
            ),
          ),
          Container(height: 75,),
          Padding(
            padding: const EdgeInsets.only(right:16.0,left: 16,bottom: 8.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(onPressed:(){},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:Center(
                    child: Text(S.of(context).login,style: TextStyle(
                      color: Colors.white,
                    ),),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:16.0,left: 16,bottom: 8.0,top: 8.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).pushNamed(AuthorizationRoutes.REGISTER_SCREEN);
              },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Theme.of(context).backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:Center(
                    child: Text(S.of(context).register,style: TextStyle(
                    ),),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
