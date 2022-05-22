// import 'package:deal_mart/shared/components/components.dart';
// import 'package:deal_mart/shared/styles/colors.dart';
// import 'package:deal_mart/shared/styles/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
//
// class ImageList {
//   final String image;
//   ImageList({required this.image,});
// }
//
// class Home extends StatefulWidget {
//  Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final controller = PageController(
//     viewportFraction:1 ,
//     initialPage: 0,
//   );
//   var isLast = false;
//
//  List listimgs = [
//    ImageList(
//  image: 'assets/images/first.jpg',
//
//  ),
//    ImageList(
//  image: 'assets/images/second.jpg',
//
//  ),
//    ImageList(
//  image: 'assets/images/third.png',
//
//  ),
//
//  ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer(
//         listener:(context, state) {}  ,
//         builder:(context,state)=> return  ;
//
//      );
//   }
// }
//
//
// Container(
// // width: double.infinity,
// child: Column(
// children: [
// Stack(
// children: [
//
//
//
// SmoothPageIndicator(
// count: listimgs.length,
// controller: controller,
// effect:const ScrollingDotsEffect(
// dotColor: Colors.grey,
// activeDotColor: defTextColor,
// dotWidth: 5,
// dotHeight: 5,
// spacing: 5.0,
// ),
// ),
// ],
// ),
// ],
// ),
// ),