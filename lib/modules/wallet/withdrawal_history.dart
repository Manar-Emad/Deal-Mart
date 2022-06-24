import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import 'deposit_history.dart';
class WithdrawalHistory extends StatelessWidget {
   WithdrawalHistory({Key? key}) : super(key: key);

  int itemCount=2;
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
                return depositCard(context,Icons.arrow_downward,redColor,'12 sep 2021','453',);
              }),
        ],
      ),
    );
  }
}
