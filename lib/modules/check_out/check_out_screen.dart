import 'dart:async';
import 'package:deal_mart/modules/check_out/payment_row.dart';
import 'package:deal_mart/modules/details/product_details.dart';
import 'package:deal_mart/modules/map/adress_information.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../map/add_address.dart';
import '../orders/order_placed_screen.dart';

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
  dynamic _value = 0;
  var formKey = GlobalKey<FormState>();

  bool isVisaNumAdded=false;

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
                  cardAddressInfo(context,GestureDetector(
                      onTap: (){navigateTo(context,  AddressInformation());},
                      child: const Text('Edit',style: TextStyle(color: primaryColor),)),),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 3),
                    child: Text(
                      'Payment method',
                      style: black14bold(),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(context)/5,
                    child: defContainer(
                      context,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PaymentRow(
                            isVisible: isVisible,
                            icon: Icons.wallet,
                            context: context,
                            payTxt: 'Visa',
                            txt: 'Pay with card',
                            widgetRadio: Radio(
                                value: 1,
                                groupValue:_value,
                                activeColor: primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                    // isVisible = !isVisible;
                                  });
                                }),
                            functionIf:(){
                              setState(() => tappedCancel = true);} ,
                            functionElse: (){
                              setState(() => tappedCancel = false);} ,
                          ),
                          PaymentRow(
                            isVisible: isVisible,
                            icon: Icons.wallet,
                            context: context,
                            payTxt: 'Visa',
                            txt: 'Pay with card',
                            widgetRadio: Radio(
                                value: 2,
                                groupValue: _value,
                                activeColor: primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                    // isVisible = !isVisible;
                                  });
                                }),
                            functionIf:(){
                              setState(() => tappedCancel = true);} ,
                            functionElse: (){
                              setState(() => tappedCancel = false);} ,
                          ),   PaymentRow(
                            isVisible:isVisible ,
                            icon: Icons.wallet,
                            context: context,
                            payTxt: 'Visa',
                            txt: 'Pay with card',
                            widgetRadio: Radio(
                                value: 3,
                                groupValue: _value,
                                activeColor: primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                    // isVisible = !isVisible;
                                  });
                                }),
                            functionIf:(){
                              setState(() => tappedCancel = true);} ,
                            functionElse: (){
                              setState(() => tappedCancel = false);} ,
                          ),
                        ],
                      ),
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
                                  txt: 'Add promo code', isClikable: false,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'please add your promo code';
                                    }
                                    return null;
                                  },
                                  onTap: (){ showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),),),
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                        height: getHeight(context)/1.7,
                                        // width: getWidth(context),
                                        child: Form(
                                          key: formKey,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5),
                                                child: Center(
                                                  child: SizedBox(width: getWidth(context)/5,
                                                    child: defaultSeparator(separatorColor),),
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
                                                child: formFeild(txt: 'Cardholder name',
                                                    validate: (value) {
                                                      if (value.isEmpty) {
                                                        return 'please add your Cardholder name';
                                                      }
                                                      return null;
                                                    },
                                                    controller: TextEditingController(),
                                                    isClikable: true),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: formFeild(txt: 'Card number',
                                                    validate: (value) {
                                                      if (value.isEmpty) {
                                                        return 'please add your card number';
                                                      }
                                                      return null;
                                                    },
                                                    type: TextInputType.phone, isClikable: true),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Row(children: [
                                                  Expanded(
                                                    flex:50,
                                                    child: formFeild(
                                                      txt: 'MM/YY',type: TextInputType.datetime,
                                                      validate: (value) {
                                                        if (value.isEmpty) {
                                                          return 'please enter the date';
                                                        }
                                                        return null;
                                                      },
                                                      isClikable: true,),
                                                  ),
                                                  const Expanded(child: SizedBox(width: 1,),flex: 1,),
                                                  Expanded(
                                                      flex: 50,
                                                      child: formFeild(txt: 'CVV',
                                                          focusedBorder: InputBorder.none,
                                                          validate: (value) {
                                                            if (value.isEmpty) {
                                                              return 'please add your CVV';
                                                            }
                                                            return null;
                                                          },
                                                          disabledBorder: InputBorder.none,
                                                          type: TextInputType.phone,isClikable: true)),
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
                                                  if(formKey.currentState!.validate()){
                                                    print('bottom sheet validate');
                                                  }
                                                    Navigator.pop(context);
                                                },
                                                  text: 'Add', borderColor: primaryColor,
                                                  color: primaryColor,txtColor: defTextColor,
                                                ),
                                              )

                                            ],),
                                        ),
                                      ),
                                    );
                                  });}),
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
                                  setState((){
                                    //isVisaNumAdded=true;
                                     isVisible=!isVisible;
                                    isVisaNumAdded=!isVisaNumAdded;
                                  });
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
                        return Card( elevation: 2,
                          child: cardItemsBuilder(
                            context,
                            '1',containerColor: scaffoldColor,
                          ),
                        );
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
                        text: isVisaNumAdded?'Pay and Checkout' :'Checkout',
                        borderColor: buttonColor,txtColor: defTextColor,
                        color:isVisaNumAdded?primaryColor  : buttonColor),
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



// enum DialogAction { cancel, delete }
//
// class AlertDialogs {
//   static Future<DialogAction?> cancelDeleteDialog(
//     BuildContext context,
//     String title,
//     String body,
//   ) async {
//     var action = await showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             //title: Text('titleeee'),
//             content: Text(body),
//             actions: [
//               FlatButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(DialogAction.cancel);
//                 },
//                 child: Text(
//                   'Cancel',
//                   style: grey12bold(),
//                 ),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(DialogAction.delete);
//                 },
//                 child: Text(
//                   'Delete',
//                   style: red12bold(),
//                 ),
//               )
//             ],
//           );
//         });
//     return (action != null) ? action = DialogAction.cancel : null;
//   }
// }

Widget cardItemsBuilder(context,String txtNum,{Color? containerColor,}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,),
      child: Container(
        decoration: BoxDecoration(
          color: defTextColor,
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
        height: getHeight(context) / 6.5,
        width: getWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                      Expanded(
                      flex: 10,
                      child: Image(fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/1-(1)-copy.png',),
                         height: getHeight(context)/10,
                         width: getWidth(context)/6,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: getHeight(context) / 15,
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
                              txtNum,
                              style: black14bold(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(child:  SizedBox(height: 1,),flex: 2,),
                  ],
                ),
              ),
              Expanded(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Column(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
