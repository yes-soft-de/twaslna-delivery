import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_our_services/state_manager/services_state_manager.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_Loaded_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_state.dart';
@injectable
class SendItScreen extends StatefulWidget {
  final ServicesStateManager _stateManager;

  SendItScreen(this._stateManager);

  @override
  SendItScreenState createState() => SendItScreenState();
}

class SendItScreenState extends State<SendItScreen> {
  late SendItState currentState;
  @override
  void initState() {
    super.initState();
    currentState = SendItLoadedState(this);
  }
  void refresh(){
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Text(S.of(context).deliverForMe,style:TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color
            ),),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).brightness != Brightness.dark ? Theme.of(context).disabledColor : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            elevation: 0,
          ),
        body:currentState.getUI(context),
      ),
    );
  }
}
