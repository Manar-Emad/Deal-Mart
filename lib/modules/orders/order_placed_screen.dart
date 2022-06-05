import 'package:deal_mart/modules/details/details_screen.dart';
import 'package:deal_mart/modules/orders/order_details_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/styles.dart';
import '../cart/cart_screen.dart';
import '../check_out/check_out_screen.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';
class OrderPlacedScreen extends StatelessWidget {
   OrderPlacedScreen({Key? key}) : super(key: key);

  int count=15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text('order placed',style: black18bold(),),
          ),
            SizedBox(
                height:getHeight(context)/8,
              child:const Image(image:  AssetImage('assets/images/checkimage.png'),
                fit: BoxFit.fill,
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: Text('Congratulation',style: prim20bold(),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Your order has been successfully placed',style: black14bold(),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Order number   #343',style: black14bold(),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Ticket and raffle details',style: black12bold(),),
                  ),
                  SizedBox(
                    height: getHeight(context)/5,
                    child: defContainer(context,
                        SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                child: Text('you will make 2 ticket from the purchase',style: black12bold(),),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: count,
                                  itemBuilder: (context, index) {
                                    return  ticketRow(1 ,'Co45678' );
                                  }),
                            ],
                          ),
                        ),
                        color: scaffoldColor ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 3),
                    child: Text(
                      'Items (2)',
                      style: black12bold(),
                    ),
                  ),
                  cardItemsBuilder(context,
                    '2', shadowColor: scaffoldColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: defaultButton(
                            context,borderColor: secondColor,
                            function: () {
                              navigateAndFinish(
                                context,
                                const DetailsScreen(),
                              );
                            },
                            text: 'Details Winners',
                            //    AppLocalization.of(context)!.translate('create_account')!
                            txtColor: secondColor,

                          ),flex: 15,
                        ),
                        const Expanded(child: SizedBox(width: 1,),flex: 1,),
                        Expanded(flex:15,
                          child: defaultButton(
                            context,borderColor: primaryColor,
                            function: () {
                              navigateTo(context, const OrderDetailsScreen());
                            },
                            text:    'Order details',
                            //AppLocalization.of(context)!.translate('sign_in')!,
                            txtColor:defTextColor ,
                            color: primaryColor,

                          ),
                        ),
                      ],
                    ),
                  ),
              ],),
            ),

        ],
    ),
      ),
    );
  }
}

Widget ticketRow(int _itemCount,String ticketNum)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Row(children: [

    Text('${_itemCount.toString()}  ticket number ',style:black12bold() ,),

    const Spacer(),

    Text(ticketNum,style: grey12bold(),),

  ],),
);