import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_store_list/store_routes.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final GestureTapCallback? onTap;
  const ProductCard({Key? key, required this.title, required this.image,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 125,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap:onTap??(){
              Navigator.of(context).pushNamed(StoreRoutes.STORE_LIST_SCREEN);
            },
            child: Stack(
              children: [
                image.contains('assets/')
                    ? Image.asset(
                        image,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      )
                    : Image.network(
                        image,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 35,
                    width: 1000,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.3),
                          ]),
                    ),
                    child: Center(
                        child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
