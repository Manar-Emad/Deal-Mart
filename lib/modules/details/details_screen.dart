import 'package:deal_mart/modules/home/home_layout.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Details'),
        leading: IconButton(icon:const Icon(Icons.arrow_back) ,
            onPressed: (){navigateTo(context, const HomeScreen());}),
      ),
      body:Column(
        children: [
            Container(
              height: getHeight(context)/10,
              width: getWidth(context)/2,
              child: TabBar(tabs: [
                Tab(text: 'Product details',),
                Tab(text: 'Prize details',),
              ]),
            )
        ],
      ),
    );
  }
}

