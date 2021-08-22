import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_stores/store_routes.dart';
import 'package:twaslna_delivery/utils/components/progresive_image.dart';
class StoreCard extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  final String image;
  StoreCard({required this.title,this.onTap,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap:onTap ?? (){
          Navigator.of(context).pushNamed(StoreRoutes.STORE_PRODUCTS);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child:Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomNetworkImage(imageSource:image,height: double.maxFinite,width:double.maxFinite,)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.star,size: 12.5,color: Colors.blue[700]),
                              Container(width: 2,),
                              Text('4.7',style: TextStyle(
                                  fontSize: 14
                              ),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('${S.of(context).views} 400'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
