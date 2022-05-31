import 'package:deal_mart/modules/map/address_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../../shared/styles/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Cart',
                style: black20bold(),
              ),
            ),
            /// listview
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 2,
            //     itemBuilder: (context, index) {
            //       return cardBuilder(context);
            //     }),
            cardBuilder(context),
            sizedBoxh2,
            cardBuilder(context),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  CircleAvatar(child: Icon(Icons.wallet_giftcard_rounded,size: 13,color: defTextColor,),
                      backgroundColor: primaryColor,
                      radius: 12,
                    ),
                  ),

                  Text('you will make',style: black14bold(),),
                const  Padding(
                    padding:  EdgeInsets.all(2.0),
                    child:  Text('2',style:TextStyle(color: greenTxt,fontSize: 14,fontWeight: FontWeight.bold,)),
                  ),
                  Text('copon from the purchase',style: black14bold(),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: defaultButton2(function: (){navigateTo(context, const AddressScreen());}, text: 'Finish the order and pay',
                  txtColor:defTextColor,color: primaryColor,text2: '15,998 EGP ', context: context ),
            ),

          ],
        ),
      ),
    );
  }
}

Widget cardBuilder(context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        height: getHeight(context) / 6,
        width: getWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: defTextColor,
              // spreadRadius: 5,
              // blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: getHeight(context) / 5,
                  width: getWidth(context) / 7,
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 40,
                        child: Image(
                          image: AssetImage('assets/images/1-(1)-copy.png'),
                          // height: getHeight(context)/4,
                          // width: getWidth(context)/6,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 1,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 11,
                        child: SizedBox(
                          height: getHeight(context) / 25,
                          width: getWidth(context) / 4,
                          child: Row(
                            children: [
                              GestureDetector(
                                child: CircleAvatar(
                                  child: const Center(
                                      child: Icon(
                                    Icons.minimize,
                                    size: 15,
                                    color: defTextColor,
                                  )),
                                  backgroundColor: textGray,
                                  radius: 15,
                                ),

                                /// minimize
                                onTap: () {},
                              ),
                              const Spacer(),
                               Text('1',style: black14bold(),),
                              const Spacer(),
                              GestureDetector(
                                child: const CircleAvatar(
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 15,
                                    color: defTextColor,
                                  )),
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                ),

                                /// maximize
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const  Expanded(child: SizedBox(width: 1,),flex: 1,),
              Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(' laptop dell z21 find dweduw dwuw',
                            style: black14bold() ,maxLines: 2,),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(bottom: 5),
                          child:  Text('7999 EGP ',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,fontSize: 14,
                            ),),
                        ),
                        Text(
                          'Win Honda accord 2021',
                          style: black12bold() ,maxLines: 2,),

                      ],
                    ),
                   const Spacer(),
                    Row(
                      children: [
                        Text(
                          ' Get',
                          style: black14bold(),
                        ),
                       const Text(
                          ' 1',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: greenTxt),
                        ),
                        Text(
                          ' raffle coupon',
                          style: black14bold(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget defaultButton2({ required BuildContext context,
  required Function()? function,
  required String text,
  Widget? child,
  Color? color,
  Color? txtColor,
  String? text2,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: getHeight(context)/13,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: primaryColor),
          //  color: buttonColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: MaterialButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox(width: 1,),flex: 5,),
              Expanded( flex: 7,
                child: Text(
                  text,
                  style: (TextStyle(
                      color: txtColor, fontSize: 16)),
                ),
              ),
              Expanded(child: SizedBox(width: 1,),flex: 1,),
              Expanded(
                flex: 4,
                child: Text(
                  text2!,
                  style: (TextStyle(
                      color: txtColor, fontSize: 14)),
                ),
              ),
              Expanded(child: SizedBox(width: 1,),flex: 1,),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(5),
          onPressed: function,
        ),
      ),
    );