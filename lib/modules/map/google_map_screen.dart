import 'package:deal_mart/modules/map/address_screen.dart';
import 'package:deal_mart/modules/map/adress_information.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import 'add_address.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: defTextColor,
      //   title: const Text(
      //     'Locate your place on the map',
      //     style: TextStyle(
      //         color: secondColor, fontSize: 16, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   leading: GestureDetector(
      //     onTap: () {
      //       navigateTo(context,  AddNewAddress());
      //     },
      //     child: const CircleAvatar(
      //         backgroundColor: defTextColor,
      //         child: Icon(
      //           Icons.arrow_back,
      //           color: secondColor,
      //           size: 30,
      //         )),
      //   ),
      // ),
      body: Column(
        children:  [
          Stack(
              children:[
                SizedBox( height: getHeight(context),
                  width: getWidth(context),
                  child:const Expanded(
                    child: Image(image: AssetImage('assets/images/map.jpg'),
                    fit: BoxFit.fill,
                    ),
                  ),),
                SizedBox(
                  height: getHeight(context),
                  width: getWidth(context),
                  child:Column(
                    children: [
                      Row(
                      children: [
                        const SizedBox(width:20,),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            onTap: () {
                              navigateTo(context,  const AddNewAddress());
                            },
                            child: const CircleAvatar(
                                backgroundColor: defTextColor,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: secondColor,
                                  size: 30,
                                )),
                          ),
                        ),
                        const SizedBox(width:80,),
                        const Text(
                          'Locate your place on the map',
                          style: TextStyle(
                              color: secondColor,
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                ),
                      const  Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30 ,horizontal: 20),
                        child: defaultButton(context,borderColor: primaryColor,
                          color: primaryColor,
                          txtColor: defTextColor,
                          function: (){
                            navigateTo(context,  AddressInformation());}, text: 'Choose the area',
                        ),
                      ),
                    ],
                  ),
                ),

                // Text('Google Map'),
              ],),

        ],
      ),
    );
  }
}
