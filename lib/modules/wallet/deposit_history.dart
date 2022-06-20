import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
class DepositHistory extends StatelessWidget {
   DepositHistory({Key? key}) : super(key: key);

 int itemCount=5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListView.builder(
            //  shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return depositCard(context,Icons.arrow_upward,greenTxt,'12 sep 2021','200',);
              }),
        ],
      ),
    );
  }
}

Widget depositCard(context,IconData icon,Color circleColor,String txt,String txtNum)=>SizedBox(
  height: getHeight(context)/11,
  child: defContainer(context, Row(children:  [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        child: Center(
            child: Icon(
              icon,
              size: 18,
              color: defTextColor,
            )),
        backgroundColor: circleColor,
        radius: 10,
      ),
    ),
    Text(txt,style: grey10bold(),),
    const Spacer(),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text('EGP $txtNum',style: black12bold(),),
    ),


  ],),
  color: defTextColor,
  ),
);