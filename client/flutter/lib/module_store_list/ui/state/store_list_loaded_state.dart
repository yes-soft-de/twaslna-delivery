import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_store_list/ui/screen/store_list_screen.dart';
import 'package:twaslna_delivery/module_store_list/ui/state/store_list_state.dart';
import 'package:twaslna_delivery/module_store_list/ui/widget/store_card.dart';
import 'package:twaslna_delivery/utils/customIcon/custom_icons.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class StoreListLoadedState extends StoreListState {
  StoreListScreenState screenState;

  StoreListLoadedState(this.screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          'assets/images/super_market.jpg',
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        Container(
          height: 100,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 25),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
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
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              color: Theme.of(context).cardColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: ListView(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 12.0, left: 12.0, bottom: 25.0, top: 25.0),
                    child: Text(
                      'سوبرماركت',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ابحث عن سوبرماركت',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.filter_list),
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(0, 13.5, 0, 0),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: FaIcon(FontAwesomeIcons.sortAmountDown,color: Theme.of(context).disabledColor,size: 18,),
                      title: Text(
                        S.of(context).highestRate,
                        style: StyleText.categoryStyle,
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.all(0),
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        childAspectRatio:
                            (MediaQuery.of(context).size.width / 2) / 135),
                    itemBuilder: (_, index) {
                      return StoreCard();
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
