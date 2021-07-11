import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_account/ui/widget/custom_field.dart';
import 'package:twaslna_delivery/module_account/ui/widget/update_button.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

@injectable
class PersonalDataScreen extends StatefulWidget {
  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final GlobalKey<FormState> _personal_data = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  String? genders = '' ;
  var gender ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(S.of(context).personalData,style:TextStyle(
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
        body:Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 150,
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.network(
                              'https://img.bundesliga.com/tachyon/sites/2/2021/06/kimmich-look-fcb-bayern.jpg?crop=128px,0px,1351px,1080px',
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Opacity(
                                opacity: 0.9,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Theme.of(context).primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add_a_photo_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _personal_data,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16),
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              S.of(context).name,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          subtitle: CustomFormField(
                            preIcon: Icon(Icons.person),
                            hintText: S.of(context).nameHint,
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              S.of(context).birthDate,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          subtitle: CustomFormField(
                            readOnly: true,
                            preIcon: Icon(Icons.calendar_today_rounded),
                            hintText: S.of(context).birthDateHint,
                            controller: dateController,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: DateTime.now(),
                              ).then((value) {
                                if (value != null) {
                                  dateController.text =
                                      DateFormat('yyyy - MM - dd').format(value);
                                  setState(() {});
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              S.of(context).gender,
                              style: TextStyle(fontWeight: FontWeight.w600),
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
                                    title: Text(S.of(context).male),
                                    value:'male',
                                    groupValue:genders,
                                    onChanged: (String? value){
                                      genders = value;
                                      setState(() {
                                      });
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
                                    title: Text(S.of(context).female),
                                    value:'female',
                                    groupValue:genders,
                                    onChanged: (String? value){
                                      genders = value;
                                      setState(() {
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: UpdateButton(onPressed:(){})),
          ],
        ),
      ),
    );
  }
}
