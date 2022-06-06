import 'package:deal_mart/modules/map/add_address.dart';
import 'package:deal_mart/modules/orders/my_orders_screen.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/styles.dart';
import '../check_out/check_out_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
   OrderDetailsScreen({Key? key}) : super(key: key);

  int itemCount=2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        title: const Text(
          'Order details',
          style: TextStyle(
            color: secondColor,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: defTextColor,
                child: Icon(
                  Icons.arrow_back,
                  color: secondColor,
                ),
              ),
            ),
            onTap: () {
              navigateTo(context, MyOrdersScreen());
            }),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getHeight(context)/5,
                      color: Colors.red,
                      child:defContainer(context,
                          Row(children: [


                      ],)) ,),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 3),
                      child: Text(
                        'Address information',
                        style: black14bold(),
                      ),
                    ),
                    cardAddressInfo(context, const SizedBox(width: 1,)),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 3),
                      child: Text(
                        'Payment information',
                        style: black14bold(),
                      ),
                    ),
                    SizedBox(
                        height: getHeight(context)/11,
                      child:defContainer(context,
                        Row(children: [
                          const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10),
                          child: Image(image: AssetImage('assets/images/egypt (1).png')),
                        ),
                          Text('**** **** ****5436',style: black12bold(),),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.wallet,color: secondColor,),
                          ),
                      ],),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 3),
                      child: Text(
                        'Items (1)',
                        style: black14bold(),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          return Card( elevation: 2,
                            child: cardItemsBuilder(
                              context,
                              '1',containerColor: defTextColor,
                            ),
                          );
                        }),
                  ]),
            ),
            Container(
              height: getHeight(context)/3.5,
              color: containerColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Taxes',
                              style: black14bold(),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'EGP',
                            style: grey14bold(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '00.00',
                              style: black14bold(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Shopping fees',
                              style: black14bold(),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'EGP',
                            style: grey14bold(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '19.00',
                              style: black14bold(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Total',
                              style: black14bold(),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'EGP',
                            style: grey14bold(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '8019',
                              style: black14bold(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.wallet_giftcard_rounded,
                                size: 13,
                                color: defTextColor,
                              ),
                              backgroundColor: primaryColor,
                              radius: 12,
                            ),
                          ),
                          Text(
                            'you will make',
                            style: black12bold(),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text('2',
                                style: TextStyle(
                                  color: greenTxt,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text(
                            'copon from the purchase',
                            style: black12bold(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}