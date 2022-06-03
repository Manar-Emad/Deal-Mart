import 'package:deal_mart/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/styles.dart';
class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text('order placed',style: black18bold(),),
        ),
          const Icon(Icons.check_circle_outline_rounded,color: greenTxt,size: 50,),
      ],),
    );
  }
}
