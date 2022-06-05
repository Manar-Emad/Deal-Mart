import 'package:deal_mart/modules/orders/order_details_screen.dart';
import 'package:deal_mart/modules/settings/settings_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../check_out/check_out_screen.dart';
class MyOrdersScreen extends StatelessWidget {
   MyOrdersScreen({Key? key}) : super(key: key);

  int itemCount=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        title: const Text('My orders',style:TextStyle(color: secondColor,),),
        centerTitle: true,
        leading: GestureDetector(
            child:const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  CircleAvatar(
                backgroundColor: defTextColor,
                child: Icon(Icons.arrow_back,color: secondColor,),),
            ),
            onTap: (){navigateTo(context, const SettingsScreen());}),
     elevation: 0,
      ),
      body: itemCount > 0 ? SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:itemCount,
                  itemBuilder: (context, index) {
                    return myOrderCard(context);
                  }),
            ],
          ),
        ),
      ) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: defTextColor,
              child:Icon(Icons.add_box,color: textGray,size:35,),
            ),
            sizedBoxh2,
            const Text('You have no orders',
              style: TextStyle(fontSize: 20,color: Colors.black45),),
          ],
        ),
      ),
    );
  }
}

Widget myOrderCard(context)=>SizedBox(
  height: getHeight(context)/2.8,
  width:getWidth(context) ,
  child: defContainer(context, Column(children: [
    Expanded(flex: 10,child:Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Text('Order number' ,style: grey16bold(),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('Order date' ,style: grey16bold(),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Text('Order status' ,style: grey16bold(),),
        ),
      ],),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text('#343' ,style:black14bold(),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Text('22 sep 2021' ,style: black14bold(),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
          child: Text('received' ,style: prim14bold()),
        ),
      ],)
    ],),),
    Expanded(flex: 1,child:Column(
      children: [
        defaultSeparator(Colors.grey[200]),
        const Spacer(),
      ],
    )),
    Expanded(flex: 13,child:cardItemsBuilder(
      context,
      '1',shadowColor: defTextColor,
      widget: Padding(
        padding: const EdgeInsets.only(top:15,bottom: 5),
        child: Row(children:  [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Order details',style: black14bold(),),
          ),
          arrowIcon((){navigateTo(context,const OrderDetailsScreen() );}),
        ],),
      )
    )),
  ],)),
);