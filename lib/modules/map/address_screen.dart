import 'package:deal_mart/modules/cart/cart_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/sizes.dart';
import 'google_map_screen.dart';
class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        title: const Text('Address',
          style: TextStyle(color: secondColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),),
         centerTitle: true,
        leading: GestureDetector(onTap: (){navigateTo(context, const CartScreen());},
          child: const CircleAvatar(backgroundColor: defTextColor,
              child: Icon(Icons.close,color: secondColor,size: 30,)),
        ),
        elevation: 0,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 40,
              backgroundColor: defTextColor,
              child:Icon(Icons.location_on_outlined,color: textGray,size:35,),
            ),
            sizedBoxh2,
            const Text('You don\'t have an address',
                   style: TextStyle(fontSize: 20,color: Colors.black45),),
            const Spacer(),
        Padding(
                padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
                child: defaultButton(context,
                  function: (){navigateTo(context,const GoogleMapScreen());},
                  text: 'Add a new address' ,
                    color: primaryColor,
                    txtColor: defTextColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
