import 'package:flutter/material.dart';
class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SingleChildScrollView(
        child: Scaffold(
         // bottomNavigationBar:  BottomNavigationBar[],
        ),
      ),
    );
  }
}
