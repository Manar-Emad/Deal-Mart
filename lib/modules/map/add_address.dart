import 'package:deal_mart/modules/map/adress_information.dart';
import 'package:deal_mart/modules/map/google_map_screen.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../check_out/check_out_screen.dart';
class AddNewAddress extends StatefulWidget {
  AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddress();
}

class _AddNewAddress extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defTextColor,
        title: const Text('Address information',style:TextStyle(color: secondColor,),),
        centerTitle: true,
        leading: GestureDetector(
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child:  CircleAvatar(
              backgroundColor: defTextColor,
              child: Icon(Icons.arrow_back,color: secondColor,),),
          ),/// TODO NAV TO WHICH SCREEN
          onTap: (){navigateTo(context,  AddressInformation());},),
        elevation: 0,
      ),
      body:Column(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:1,
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
                              children: const [
                                Spacer(),
                                Text('Edit',style: TextStyle(color: primaryColor),),

                              ],
                            )

                          ],
                        ),
                      );
                    }),
                defaultButton(context,borderColor: primaryColor,
                    /// TODO NAV TO WHICH SCREEN ?????/????
                    function: (){navigateTo(context, const GoogleMapScreen());},
                    text: 'Add a new address',
                color: primaryColor,
                  txtColor: defTextColor,
                ),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}


