import 'package:deal_mart/modules/map/adress_information.dart';
import 'package:deal_mart/modules/map/google_map_screen.dart';
import 'package:deal_mart/modules/settings/profile_screen.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../check_out/check_out_screen.dart';
import '../settings/settings_screen.dart';
class AddNewAddress extends StatefulWidget {
  AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddress();
}

class _AddNewAddress extends State<AddNewAddress> {

  int itemCount= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar:itemCount>0 ? AppBar(
        backgroundColor: defTextColor,
        title: const Text('My Address',style:TextStyle(color: secondColor,),),
        centerTitle: true,
        leading: GestureDetector(
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child:  CircleAvatar(
              backgroundColor: defTextColor,
              child: Icon(Icons.arrow_back,color: secondColor,),),
          ),/// TODO NAV TO WHICH SCREEN
          onTap: (){Navigator.pop(context);}),
        elevation: 0,
      ) :AppBar(
        backgroundColor: defTextColor,
        title: const Text('Address',style:TextStyle(color: secondColor,),),
        centerTitle: true,
        leading: GestureDetector(
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child:  CircleAvatar(
              backgroundColor: defTextColor,
              child: Icon(Icons.close,color: secondColor,),),
          ),/// TODO NAV TO WHICH SCREEN
          onTap: (){Navigator.pop(context);},),
        elevation: 0,
      ),
      body:itemCount > 0 ?
      SingleChildScrollView(
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
                    return defContainer(context,
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                txtMaxLines1('Elbaron, maddi,cairo'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                txtMaxLines1('Abraj sama 28D 1 apartment'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                txtMaxLines1('Ahmed mohamed'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                txtMaxLines1('01212345673'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children:  [
                              Spacer(),
                              GestureDetector(
                                  onTap: (){navigateTo(context, const GoogleMapScreen());},
                                  child: const Text('Edit',style: TextStyle(color: primaryColor),)),

                            ],
                          )

                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: defaultButton(context,borderColor: primaryColor,
                    /// TODO NAV TO WHICH SCREEN ?????/????
                    function: (){navigateTo(context,   const SettingsScreen());},
                    text: 'Add a new address',
                color: primaryColor,
                  txtColor: defTextColor,
                ),
              ),
            ],
          ),
        ),
      ) :
      Center(
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
              child: defaultButton(context,borderColor: primaryColor,
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


