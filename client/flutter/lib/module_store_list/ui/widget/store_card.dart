import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
class StoreCard extends StatelessWidget {
  const StoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Super Market',
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height:35,
                  decoration: BoxDecoration(
                    color:Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.star,size: 12.5,),
                        Padding(
                          padding: const EdgeInsets.only(bottom:4.0,left: 4,right:4,top: 4),
                          child: Text('4.7',style: TextStyle(
                              fontSize: 14
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height:35,
                  decoration: BoxDecoration(
                    color:Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:4.0,left: 8,right:8,top: 12),
                    child: Text('${S.of(context).views} 400'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
