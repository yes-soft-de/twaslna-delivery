import 'package:flutter_svg/svg.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_auth/authorization_routes.dart';
import 'package:twaslna_delivery/module_auth/ui/screen/register_screen/register_screen.dart';
import 'package:twaslna_delivery/module_auth/ui/states/register_states/register_state.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/login_widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/rigester/custom_register_app_bar.dart';
import 'package:twaslna_delivery/utils/images/images.dart';

class RegisterStateInit extends RegisterState {
  RegisterStateInit(RegisterScreenState screen) : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        Form(
          child: ListView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(height: 100,),
              MediaQuery.of(context).viewInsets.bottom == 0 ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(ImageAsset.LOGO,width: 100,height: 100,),
              ):Container(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0,left: 85,right: 85,top: 24),
                child: Text(S.of(context).name,style: TextStyle(
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
                    child: Icon(Icons.person),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLoginFormField(),
                ),
              ),
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
                  child: CustomLoginFormField(),
                ),
              ),
              Container(height: 75,),
            ],
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: CustomRegisterAppBar()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height:150,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                  ]),
            ),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              direction:Axis.vertical,children: [
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
                        child: Text(S.of(context).register,style: TextStyle(
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
                        child: Text(S.of(context).iHaveAnAccount,style: TextStyle(
                        ),),
                      )),
                ),
              ),
            ],),
          ),
        ),
      ],
    );
  }
}
