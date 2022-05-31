import 'package:deal_mart/modules/details/product_details.dart';
import 'package:deal_mart/modules/map/google_map_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
class AddressInformation extends StatelessWidget {
  const AddressInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locate your place on the map'),
        centerTitle: true,
        leading: GestureDetector(
          child:const CircleAvatar(
            backgroundColor: defTextColor,
            child: Icon(Icons.arrow_back,color: secondColor,),),
          onTap: (){navigateTo(context, const GoogleMapScreen());},),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
             height: getHeight(context) / 9,
              color: Colors.red,
              child: Row(children: [
                const Text('Elbaron,maddi,cairo'),
                const Spacer(),
                smallContainer(
                  getHeight(context) / 12,
                  getWidth(context) / 5.7,
                  context,
                  const Center(
                    child:  Icon(
                      Icons.minimize,
                      color: Colors.black26,
                    ),
                  ),
                  Colors.grey,
                  /// TABBED MINUS
                      () {},
                ),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
