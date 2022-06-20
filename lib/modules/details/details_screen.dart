import 'package:deal_mart/modules/details/product_details.dart';
import 'package:deal_mart/modules/details/prize_details.dart';
import 'package:deal_mart/modules/home/home_layout.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';

import '../../shared/app_cubit/app_cubit.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with SingleTickerProviderStateMixin{
   TabController? tabController;

  @override
  void initState(){
    tabController=TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          backgroundColor: defTextColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Details',
            style: TextStyle(color: secondColor,),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back,color: secondColor,),
              onPressed: () {
                navigateTo(context, AppCubit.get(context).changeBottom(0) );
                /// navigate to homeScreen
               // navigateTo(context, const HomeScreen());
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color:Colors.grey,width: .5 ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: getHeight(context) / 15,
                  width: getWidth(context) / 1.3,
                  child: TabBar(
                    unselectedLabelColor: secondColor,
                    labelColor: defTextColor,
                      unselectedLabelStyle:const TextStyle(fontWeight: FontWeight.bold) ,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    indicatorWeight: 1,
                    controller: tabController,
                      indicator:  BoxDecoration(
                        borderRadius: BorderRadius.circular(5),

                        color: primaryColor,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Product details',
                        ),
                        Tab(
                          text: 'Prize details',
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children:const [
                   ProductDetails(),
                   PrizeDetails(),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}


