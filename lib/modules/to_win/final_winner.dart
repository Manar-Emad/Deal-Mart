import 'package:deal_mart/modules/to_win/winners_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../home/home_layout.dart';
class FinalWinnersScreen extends StatelessWidget {
  FinalWinnersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title:  const Text(
          'Final Winner',
          style: TextStyle(color: secondColor),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: secondColor,),
            onPressed: () {
              navigateTo(context, AppCubit.get(context).changeBottom(0));
              /// navigate to homeScreen
             // navigateTo(context, const HomeScreen());
            }),
      ),
      body: Center(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: buildWinnerContainer(context,
            'yeoman ahmed',
            '50,000  USD',
            'assets/images/giftImage.png',
        ),
          ),],
        ),
      ),
    );

  }
}