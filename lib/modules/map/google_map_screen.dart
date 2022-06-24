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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: defTextColor,
        title: const Text(
          'Locate your place on the map',
          style: TextStyle(
              color: secondColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            navigateTo(context,  AddNewAddress());
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
      body: Column(
        children:  [
          Stack(
              children:const[
                 Image(image: AssetImage('assets/images/mmmmmm.jpg'),),
                 Text('Google Map'),
              ],),
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
    );
  }
}
