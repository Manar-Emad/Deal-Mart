import 'dart:async';
import 'package:deal_mart/modules/details/product_details.dart';
import 'package:deal_mart/modules/map/adress_information.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';

final scaffoldState = GlobalKey<ScaffoldState>();

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool tappedCancel = false;
  bool isVisible = false;
  int itemCount = 1;
  dynamic _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        title: const Text(
          'Checkout',
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
            navigateTo(context, AddressInformation());
          },
        ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 3),
                    child: Text(
                      'Address information',
                      style: black14bold(),
                    ),
                  ),
                  defContainer(
                    context,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8,),
                          child: Row(
                            children: [
                              txtMaxLinesB1('Elbaron, maddi,cairo'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              txtMaxLinesB1('Abraj sama 28D 1 apartment'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              txtMaxLinesB1('Ahmed mohamed'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              txtMaxLinesB1('01212345673'),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,fontSize: 13),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 3),
                    child: Text(
                      'Payment method',
                      style: black14bold(),
                    ),
                  ),
                  defContainer(
                    context,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Column(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         isVisible = !isVisible;
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding:
                        //                 const EdgeInsets.symmetric(horizontal: 10),
                        //             child: Radio(
                        //                 value: 3,
                        //                 groupValue: _value,
                        //                 activeColor: primaryColor,
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     _value = value;
                        //                   });
                        //                 }),
                        //           ),
                        //           Padding(
                        //             padding:
                        //                 const EdgeInsets.symmetric(horizontal:5),
                        //             child: Text(
                        //               'Pay with card',
                        //               style: black14bold(),
                        //             ),
                        //           ),
                        //           const Spacer(),
                        //           const Padding(
                        //             padding: EdgeInsets.symmetric(horizontal: 10),
                        //             child: Icon(
                        //               Icons.shopping_bag_outlined,
                        //               color: secondColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Visibility(
                        //       visible: isVisible,
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 20),
                        //         child: Row(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 10),
                        //               child: Text(
                        //                 'Visa',
                        //                 style: black10bold(),
                        //               ),
                        //             ),
                        //             Text(
                        //               '**** **** **** 5436',
                        //               style: black12bold(),
                        //             ),
                        //             const Spacer(),
                        //             TextButton(
                        //               child: Text(
                        //                 'Delete',
                        //                 style: grey10bold(),
                        //               ),
                        //               onPressed: () async {
                        //                 final action =
                        //                     await AlertDialogs.cancelDeleteDialog(
                        //                         context,
                        //                         'logggg',
                        //                         'Do you want to delete the card');
                        //
                        //                 if (action == DialogAction.cancel) {
                        //                   setState(() => tappedCancel = true);
                        //                 } else {
                        //                   setState(() => tappedCancel = false);
                        //                 }
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         isVisible = !isVisible;
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding:
                        //             const EdgeInsets.symmetric(horizontal: 10),
                        //             child: Radio(
                        //                 value: 2,
                        //                 groupValue: _value,
                        //                 activeColor: primaryColor,
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     _value = value;
                        //                   });
                        //                 }),
                        //           ),
                        //           Padding(
                        //             padding:
                        //             const EdgeInsets.symmetric(horizontal: 5),
                        //             child: Text(
                        //               'Pay with card',
                        //               style: black14bold(),
                        //             ),
                        //           ),
                        //           const Spacer(),
                        //           const Padding(
                        //             padding: EdgeInsets.symmetric(horizontal: 10),
                        //             child: Icon(
                        //               Icons.shopping_bag_outlined,
                        //               color: secondColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Visibility(
                        //       visible: isVisible,
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 20),
                        //         child: Row(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 10),
                        //               child: Text(
                        //                 'Visa',
                        //                 style: black10bold(),
                        //               ),
                        //             ),
                        //             Text(
                        //               '**** **** **** 5436',
                        //               style: black12bold(),
                        //             ),
                        //             const Spacer(),
                        //             TextButton(
                        //               child: Text(
                        //                 'Delete',
                        //                 style: grey10bold(),
                        //               ),
                        //               onPressed: () async {
                        //                 final action =
                        //                 await AlertDialogs.cancelDeleteDialog(
                        //                     context,
                        //                     'logggg',
                        //                     'Do you want to delete the card');
                        //
                        //                 if (action == DialogAction.cancel) {
                        //                   setState(() => tappedCancel = true);
                        //                 } else {
                        //                   setState(() => tappedCancel = false);
                        //                 }
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         isVisible = !isVisible;
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Padding(
                        //             padding:
                        //             const EdgeInsets.symmetric(horizontal: 10),
                        //             child: Radio(
                        //                 value: 3,
                        //                 groupValue: _value,
                        //                 activeColor: primaryColor,
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     _value = value;
                        //                   });
                        //                 }),
                        //           ),
                        //           Padding(
                        //             padding:
                        //             const EdgeInsets.symmetric(horizontal: 5),
                        //             child: Text(
                        //               'Pay with card',
                        //               style: black14bold(),
                        //             ),
                        //           ),
                        //           const Spacer(),
                        //           const Padding(
                        //             padding: EdgeInsets.symmetric(horizontal: 10),
                        //             child: Icon(
                        //               Icons.shopping_bag_outlined,
                        //               color: secondColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Visibility(
                        //       visible: isVisible,
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 20),
                        //         child: Row(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 10),
                        //               child: Text(
                        //                 'Visa',
                        //                 style: black10bold(),
                        //               ),
                        //             ),
                        //             Text(
                        //               '**** **** **** 5436',
                        //               style: black12bold(),
                        //             ),
                        //             const Spacer(),
                        //             TextButton(
                        //               child: Text(
                        //                 'Delete',
                        //                 style: grey10bold(),
                        //               ),
                        //               onPressed: () async {
                        //                 final action =
                        //                 await AlertDialogs.cancelDeleteDialog(
                        //                     context,
                        //                     'logggg',
                        //                     'Do you want to delete the card');
                        //
                        //                 if (action == DialogAction.cancel) {
                        //                   setState(() => tappedCancel = true);
                        //                 } else {
                        //                   setState(() => tappedCancel = false);
                        //                 }
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        GestureDetector(
                          onTap: (){},
                          child: buildPaymentRow(context: context,
                          widgetRadio:  Radio(
                                            value: 1,
                                            groupValue: _value,
                                            activeColor: primaryColor,
                                            onChanged: (value) {
                                              setState(() {
                                                _value = value;
                                               // isVisible = !isVisible;
                                              });
                                            }),
                            /// ////////////////
                            txt: 'Pay with card',
                            icon: Icons.shopping_bag_outlined,
                            payTxt: 'Visa',
                            functionIf: (){setState( ()=> tappedCancel=true);},
                            functionElse: (){setState( ()=> tappedCancel=false);},
                          ),
                        ),
                        buildPaymentRow(context: context,
                          //functionTapped:(){setState((){isVisible = !isVisible;}); },
                          widgetRadio:  Radio(
                              value: 2,
                              groupValue: _value,
                              activeColor: primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                 // isVisible = !isVisible;
                                });
                              }),
                          visible: isVisible,
                          txt: 'Pay with card',
                          icon: Icons.shopping_bag_outlined,
                          payTxt: 'Visa',
                          functionIf: (){setState( ()=> tappedCancel=true);},
                          functionElse: (){setState( ()=> tappedCancel=false);},
                        ),
                        PaymentRow(context: context,
                         // functionTapped:(){setState((){isVisible = !isVisible;}); },
                          widgetRadio:  Radio(
                              value: 3,
                              groupValue: _value,
                              activeColor: primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                 // isVisible = !isVisible;
                                });
                              }),
                          visible: isVisible,
                          txt: 'Pay with card',
                          icon: Icons.shopping_bag_outlined,
                          payTxt: 'Visa',
                          functionIf: (){setState( ()=> tappedCancel=true);},
                          functionElse: (){setState( ()=> tappedCancel=false);},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 3),
                    child: Text(
                      'Promo code',
                      style: black14bold(),
                    ),
                  ),
                  cardProductBuilder(
                      context,
                      getHeight(context) / 7,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: formFeild(
                                  txt: 'Add promo code', isClikable: true),
                              flex: 15,
                            ),
                            const Expanded(
                              child: SizedBox(
                                width: 1,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: getHeight(context)/15,
                                child: defaultButton(context, borderColor: greenTxt,
                                    function: () {
                                  print('promo code');
                                },
                                    text: 'Apply',
                                    color: greenTxt,
                                    txtColor: defTextColor),
                              ),
                              flex: 5,
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 3),
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
                        return cardItemsBuilder(context);
                      }),
                ],
              ),
            ),
            Container(color: containerColor,child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                    Row( children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Taxes',style: black14bold(),),
                      ),
                      const Spacer(),
                      Text('EGP',style: grey14bold(),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('00.00',style: black14bold(),),
                      ),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                    Row( children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Shopping fees',style: black14bold(),),
                      ),
                      const Spacer(),
                      Text('EGP',style: grey14bold(),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('19.00',style: black14bold(),),
                      ),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                    Row( children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Total',style: black14bold(),),
                      ),
                      const Spacer(),
                      Text('EGP',style: grey14bold(),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('8019',style: black14bold(),),
                      ),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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

                        Text('you will make',style: black12bold(),),
                        const  Padding(
                          padding:  EdgeInsets.all(2.0),
                          child:  Text('2',style:TextStyle(color: greenTxt,fontSize: 12,fontWeight: FontWeight.bold,)),
                        ),
                        Text('copon from the purchase',style: black12bold(),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40,left: 20,top: 10,right: 20),
                    child: defaultButton(context,
                        function: (){
                      navigateTo(context, OrderPlacedScreen());
                        },
                        text: isVisaNumAdded? 'Checkout':'Pay and Checkout',
                        borderColor: buttonColor,txtColor: defTextColor,
                        color:isVisaNumAdded? buttonColor : primaryColor),
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}

Widget buildPaymentRow({
  Widget? widgetRadio,
  IconData? icon,
  // Widget? widgetButton,
  Function? functionIf,
  Function? functionElse,
  required BuildContext context,
  String? txt,
  bool? visible,
  // String? visaNum,
  String? payTxt,
}) =>
    Column(
      children: [
        GestureDetector(
          onTap: (){
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),),),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: getHeight(context)/1.9,
                     // width: getWidth(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Center(
                            child: SizedBox(width: getWidth(context)/5,
                              child: defaultSeparator(const Color(0xff707070)),),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                           TextButton(onPressed: (){ Navigator.pop(context);},
                               child: Text('Cancel',style: grey12bold(),)),
                          ],),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text('Enter the card information',style: black14bold(),),
                        ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: formFeild(txt: 'Cardholder name', controller: TextEditingController(),isClikable: true),
                         ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: formFeild(txt: 'Card number',type: TextInputType.phone, isClikable: true),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(children: [
                            Expanded(
                              flex:50,
                              child: formFeild(
                                txt: 'MM/YY',type: TextInputType.datetime,
                                isClikable: true,),
                            ),
                            const Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Expanded(
                              flex: 50,
                                child: formFeild(txt: 'CVV', type: TextInputType.phone,isClikable: true)),
                          ],),
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(Icons.check_circle_outline,color: greenTxt,),
                            ),
                            Text('Do not worry the card information is safe',style: black10bold(),),
                          ],),
                          defaultButton(context, function: (){
                            ///TODO
                            ///اضيف ال visibility

                          },
                              text: 'Add', borderColor: primaryColor,
                          color: primaryColor,txtColor: defTextColor,
                          )

                      ],),
                    ),
                  );
                });},
          child: Row(
            children: [
              widgetRadio!,
              //     Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              // child: Radio(value: 1, groupValue: val,
              //       onChanged:function),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  txt!,
                  style: black14bold(),
                ),
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  icon,
                  color: secondColor,
                ),
              ),

            ],
          ),
        ),
            Visibility(
              visible: visible!,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      child: Text(
                        payTxt!,
                        style: visa20bold(),
                      ),
                    ),
                    Text(
                      '**** **** **** 5436',
                      style: black12bold(),
                    ),
                    const Spacer(),
                    TextButton(
                      child: Text(
                        'Delete',
                        style: grey10bold(),
                      ),
                      onPressed: () async {
                        final action =
                            await AlertDialogs.cancelDeleteDialog(
                                context,
                                'logggg',
                                'Do you want to delete the card');

                        if (action == DialogAction.cancel) {
                         // setState(() => tappedCancel = true);
                           functionIf;
                        } else {
                         // setState(() => tappedCancel = false);
                           functionElse;
                        }
                      },
                    ),
                  ],
                ),
              ),
),
]
    );

enum DialogAction { cancel, delete }

class AlertDialogs {
  static Future<DialogAction?> cancelDeleteDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    var action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //title: Text('titleeee'),
            content: Text(body),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogAction.cancel);
                },
                child: Text(
                  'Cancel',
                  style: grey12bold(),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogAction.delete);
                },
                child: Text(
                  'Delete',
                  style: red12bold(),
                ),
              )
            ],
          );
        });
    return (action != null) ? action = DialogAction.cancel : null;
  }
}

Widget cardItemsBuilder(context) => Padding(
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
                          width: getWidth(context) / 5,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Quantity',
                                  style: grey14bold(),
                                ),
                              ),
                              Text(
                                '1',
                                style: black14bold(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  width: 1,
                ),
                flex: 1,
              ),
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
                          child: Text(
                            ' laptop dell z21 find dweduw dwuw',
                            style: black12bold(),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            '7999 EGP ',
                            style: black14bold(),
                          ),
                        ),
                        Text(
                          'Win Honda accord 2021',
                          style: black12bold(),
                          maxLines: 2,
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



class PaymentRow extends StatefulWidget {
   PaymentRow({Key? key,context, widgetRadio}) : super(key: key);

  @override
  State<PaymentRow> createState() => _PaymentRowState();
}

class _PaymentRowState extends State<PaymentRow> {
  bool isVisibile= false;
  bool isVisaNumAdded=false;
  @override
  Widget build(BuildContext context) {
    // Widget? widgetRadio;
    //     IconData? icon;
    // // Widget? widgetButton;
    // Function? functionIf;
    // Function? functionElse;
    //  BuildContext? context;
    // String? txt;
    // // String? visaNum;
    // String? payTxt;
    return Column(
        children: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),),),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: getHeight(context)/1.9,
                        // width: getWidth(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Center(
                                child: SizedBox(width: getWidth(context)/5,
                                  child: defaultSeparator(const Color(0xff707070)),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:  [
                                  TextButton(onPressed: (){ Navigator.pop(context);},
                                      child: Text('Cancel',style: grey12bold(),)),
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text('Enter the card information',style: black14bold(),),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(txt: 'Cardholder name', controller: TextEditingController(),isClikable: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(txt: 'Card number',type: TextInputType.phone, isClikable: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(children: [
                                Expanded(
                                  flex:50,
                                  child: formFeild(
                                    txt: 'MM/YY',type: TextInputType.datetime,
                                    isClikable: true,),
                                ),
                                const Expanded(child: SizedBox(width: 1,),flex: 1,),
                                Expanded(
                                    flex: 50,
                                    child: formFeild(txt: 'CVV', type: TextInputType.phone,isClikable: true)),
                              ],),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(Icons.check_circle_outline,color: greenTxt,),
                                ),
                                Text('Do not worry the card information is safe',style: black10bold(),),
                              ],),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: defaultButton(context, function: (){
                                ///TODO
                                ///اضيف ال visibility
                                setState((){
                                  isVisibile=!isVisibile;
                                  isVisaNumAdded=!isVisaNumAdded;
                                });
                              },
                                text: 'Add', borderColor: primaryColor,
                                color: primaryColor,txtColor: defTextColor,
                              ),
                            )

                          ],),
                      ),
                    );
                  });},
            child: Row(
              children: [
                widgetRadio!,
                //     Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                // child: Radio(value: 1, groupValue: val,
                //       onChanged:function),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    txt!,
                    style: black14bold(),
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    icon,
                    color: secondColor,
                  ),
                ),

              ],
            ),
          ),
          Visibility(
            visible: isVisibile,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: Text(
                      payTxt!,
                      style: visa20bold(),
                    ),
                  ),
                  Text(
                    '**** **** **** 5436',
                    style: black12bold(),
                  ),
                  const Spacer(),
                  TextButton(
                    child: Text(
                      'Delete',
                      style: grey10bold(),
                    ),
                    onPressed: () async {
                      final action =
                      await AlertDialogs.cancelDeleteDialog(
                          context!,
                          'logggg',
                          'Do you want to delete the card');

                      if (action == DialogAction.cancel) {
                       // setState(() => tappedCancel = true);
                        functionIf;
                      } else {
                        // setState(() => tappedCancel = false);
                        functionElse;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}



/// /////////////////////////////////////////////////////
// Widget buildPaymentRow({
//   Widget? widgetRadio,
//   IconData? icon,
//   // Widget? widgetButton,
//   Function? functionIf,
//   Function? functionElse,
//   required BuildContext context,
//   String? txt,
//   bool? visible,
//   // String? visaNum,
//   String? payTxt,
// }) =>
//     Column(
//         children: [
//           GestureDetector(
//             onTap: (){
//               showModalBottomSheet(
//                   context: context,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(25.0),),),
//                   builder: (context) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: SizedBox(
//                         height: getHeight(context)/1.9,
//                         // width: getWidth(context),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Center(
//                                 child: SizedBox(width: getWidth(context)/5,
//                                   child: defaultSeparator(const Color(0xff707070)),),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children:  [
//                                   TextButton(onPressed: (){ Navigator.pop(context);},
//                                       child: Text('Cancel',style: grey12bold(),)),
//                                 ],),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Text('Enter the card information',style: black14bold(),),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: formFeild(txt: 'Cardholder name', controller: TextEditingController(),isClikable: true),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: formFeild(txt: 'Card number',type: TextInputType.phone, isClikable: true),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Row(children: [
//                                 Expanded(
//                                   flex:50,
//                                   child: formFeild(
//                                     txt: 'MM/YY',type: TextInputType.datetime,
//                                     isClikable: true,),
//                                 ),
//                                 const Expanded(child: SizedBox(width: 1,),flex: 1,),
//                                 Expanded(
//                                     flex: 50,
//                                     child: formFeild(txt: 'CVV', type: TextInputType.phone,isClikable: true)),
//                               ],),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 5),
//                                   child: Icon(Icons.check_circle_outline,color: greenTxt,),
//                                 ),
//                                 Text('Do not worry the card information is safe',style: black10bold(),),
//                               ],),
//                             defaultButton(context, function: (){
//                               ///TODO
//                               ///اضيف ال visibility
//                               setState((){});
//                             },
//                               text: 'Add', borderColor: primaryColor,
//                               color: primaryColor,txtColor: defTextColor,
//                             )
//
//                           ],),
//                       ),
//                     );
//                   });},
//             child: Row(
//               children: [
//                 widgetRadio!,
//                 //     Padding(
//                 // padding: const EdgeInsets.symmetric(horizontal: 10),
//                 // child: Radio(value: 1, groupValue: val,
//                 //       onChanged:function),),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     txt!,
//                     style: black14bold(),
//                   ),
//                 ),
//
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Icon(
//                     icon,
//                     color: secondColor,
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           Visibility(
//             visible: visible!,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10),
//                     child: Text(
//                       payTxt!,
//                       style: visa20bold(),
//                     ),
//                   ),
//                   Text(
//                     '**** **** **** 5436',
//                     style: black12bold(),
//                   ),
//                   const Spacer(),
//                   TextButton(
//                     child: Text(
//                       'Delete',
//                       style: grey10bold(),
//                     ),
//                     onPressed: () async {
//                       final action =
//                       await AlertDialogs.cancelDeleteDialog(
//                           context,
//                           'logggg',
//                           'Do you want to delete the card');
//
//                       if (action == DialogAction.cancel) {
//                         // setState(() => tappedCancel = true);
//                         functionIf;
//                       } else {
//                         // setState(() => tappedCancel = false);
//                         functionElse;
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]
//     );