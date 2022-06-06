import 'package:deal_mart/modules/orders/my_orders_screen.dart';
import 'package:deal_mart/modules/settings/profile_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../shared/styles/sizes.dart';
import '../map/add_address.dart';
import '../payment/wallet_screen.dart';
import 'contact_us_screen.dart';

class SettingsScreen extends StatefulWidget {
   const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Profile',
              style: black20bold(),
            ),
          ),
          SizedBox(
            height: getHeight(context) / 7,
            width: getWidth(context),
            child: Row(
              children: [
                  Expanded(child:defContainer(context,
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Expanded(
                        flex: 30,
                        child: CircleAvatar(
                          radius: 40,
                            backgroundColor: textGray,
                            child: CircleAvatar(
                              backgroundColor: defTextColor,
                              radius: 38,
                              child: Icon(
                                Icons.person,
                                color: textGray,size: 50,
                              ),
                            ),
                        ),
                      ),
                      Expanded(
                        flex: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,left: 2,right: 2,bottom: 5),
                            child: Text('Ahmed mohamed',style: black16bold(),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Text('Ahmed@gmail.com',style: grey10bold(),),
                          ),
                        ],),
                      ),
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                          GestureDetector(
                            onTap: (){navigateTo(context, const ProfileScreen());},
                              child: Icon(Icons.settings,color: textGray,)),
                            const Spacer(),
                      ],),
                        ),
                    ],
                  ),
                  ) ,flex: 30,),
                const Expanded(child:SizedBox(width: 1,) ,flex: 1,),
                Expanded(child: defContainer(context, Column(
                  children: [
                    Row(
                      children:  [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.wallet,color: greenTxt,),
                      ),
                      arrowIcon((){navigateTo(context, const WalletBallenceScreen());}),
                    ],),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Wallet balance',style: black10bold(),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('EGP',style: grey12bold(),),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('452',style: TextStyle(color: greenTxt,
                              fontWeight:FontWeight.bold ,
                          fontSize: 12),),
                        ),
                      ],
                    ),
                  ],
                )),flex: 10,),
              ],
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'My account',
                  style: black14bold(),
                ),
              ),
              SizedBox(
                height: getHeight(context)/4.55,
                child: defContainer(context,
                    Column(children: [
                        settingsRow(Icons.add_box, 'My orders',
                            arrowIcon((){navigateTo(context, MyOrdersScreen());}) ),
                      defaultSeparator( greySeparatorColor),
                        settingsRow(Icons.my_location, 'My address',
                            arrowIcon((){navigateTo(context,  AddNewAddress());}) ),
                      defaultSeparator( greySeparatorColor),
                        settingsRow(Icons.person, 'Profile',
                            arrowIcon((){const ProfileScreen();}) ),


                ],)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Settings',
                  style: black14bold(),
                ),
              ),
              SizedBox(
                height: getHeight(context)/2.67,
                child: defContainer(context,
                    Column(children: [
                      settingsRow(Icons.language, 'language', Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('العربيه',style: black16bold(),),
                          ),
                          arrowIcon((){}),
                        ],
                      ) ),
                      defaultSeparator( greySeparatorColor),
                      settingsRow(Icons.flag_outlined, 'Country', Row(
                        children: [
                          SizedBox(
                            height: getHeight(context)/30,
                            width: getWidth(context)/8,
                          child:const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10),
                            child:  Image(image: AssetImage('assets/images/egypt (1).png')),
                          ),
                          ),
                          arrowIcon((){}),
                        ],
                      ) ),
                      defaultSeparator( greySeparatorColor),
                      settingsRow(Icons.currency_bitcoin_outlined, 'Currency',
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text('EGP',style: grey14bold(),),
                          )),
                      defaultSeparator( greySeparatorColor),
                      settingsRow(Icons.notification_important_outlined, 'Notifications',
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:25),
                          child: FlutterSwitch(
                              height: getHeight(context)/37,
                          width: getWidth(context)/13,
                            inactiveColor: const Color(0xffEBE6E6),
                          activeColor: primaryColor,padding: 0,
                          value: notification,
                          onToggle: ( value) {
                          setState(() {
                            notification = value;
                          }); },
                      ),
                        ),
                          ),
                      defaultSeparator( greySeparatorColor),
                      settingsRow(Icons.phone_enabled_outlined, 'Contact us',
                      arrowIcon((){navigateTo(context, const ContactUsScreen());}),
                      ),
                    ],)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Sign out',style: red14bold(),),
              ),
        ]),
      ),
    );
  }
}
Widget settingsRow(IconData icon,String txt,Widget? widget)=>Column(
  children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          child: Row(children: [
      Icon(icon,color: primaryColor,),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(txt,style: black14bold(),),
      ),
      const Spacer(),
       Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
      child: widget!,

      ),
    ],),
        ),
  ],
);

Widget arrowIcon(Function()? function)=>GestureDetector(
  onTap: function,
  child:   const Icon(
    Icons.arrow_forward_ios,color: secondColor,size: 15,),
);
