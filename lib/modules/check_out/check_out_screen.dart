import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar:  AppBar(
          centerTitle: true,
          backgroundColor: defTextColor,
          elevation: 0,
          title:const Text('Checkout',
            style: TextStyle(color: secondColor,
                //fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),


    );
  }
}
