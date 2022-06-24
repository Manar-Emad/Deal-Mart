import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../home/home_layout.dart';
class TopWinnersScreen extends StatelessWidget {
  TopWinnersScreen({Key? key}) : super(key: key);

  int itemCount=5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Top Winners',
          style: TextStyle(color: secondColor,),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: secondColor,),
            onPressed: () {
              navigateTo(context, const HomeLayout());
            }),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:itemCount,
                itemBuilder: (context, index) {
                  return buildWinnerContainer(context,
                      'Samy mohamed',
                      'Honda accord 2021',
                      'assets/images/giftImage.png',
                  );
                }),],
          ),
        ),
      ),
    );

  }
}
 Widget buildWinnerContainer(context,String txt,String winTxt,String img)=>Padding(
   padding: const EdgeInsets.symmetric(horizontal: 20),
   child: SizedBox(

     height: getHeight(context)/2.8,
     width: getWidth(context),
     child: Stack(
       children: <Widget>[
         Positioned(
           bottom: 190.0,
           left: 0.0,
           right: 0.0,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 3),
             child: Card(
               margin: EdgeInsets.zero,
               elevation: 0.5,
               color: yellowColor,
               shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
               ),
               child: SizedBox(
                 width: double.infinity,
                 height: getHeight(context)/11,
                 child:  Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                       child: Row(children: [
                         Padding(padding: const EdgeInsets.all(5),
                           child: Text('Winners',style: black12bold()),),
                         Padding(padding: const EdgeInsets.all(5),
                           child: Text('Ticket number',style: black12bold(),),),
                         Padding(padding: const EdgeInsets.all(5),
                           child: Text('#Co45678',style: black12bold(),),),
                       ],),
                     ),
                     const Spacer(),
                   ],
                 ),
               ),
             ),
           ),
         ),
         Positioned(
           bottom: 20.0,
           left: 0.0,
           right: 0.0,
           child: Card(
             margin: EdgeInsets.zero,
             elevation: .5,
             color: defTextColor,
             shape: const RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(20.0)),
             ),
             child: SizedBox(
               width: double.infinity,
               height: getHeight(context)/3.6,
               child:Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(
                     //color: Colors.red,
                     height: getHeight(context)/6,
                     width: getWidth(context)/3,
                     child: Stack(
                         children:  [
                            Positioned( left: 0,right: 0,top: 1,
                         child: Image(image: AssetImage(img),

                           ),
                       ),
                           const  Positioned(left: 0,right: 0,bottom: 15,
                         child: CircleAvatar(radius: 33,child: Image(image:
                         AssetImage('assets/images/Ellipse 152.png'),),),
                       ),
                           Positioned(left: 0,right: 0,bottom: 6,
                             child: Image(image:
                             const AssetImage('assets/images/Group 962.png'),
                               height: getHeight(context)/30,
                               width: getWidth(context)/20,
                               ),
                           ),
                     ]),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 5),
                     child: Text(txt,style: black14regular(),),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5),
                         child: Text('winner',style: black14regular(),),
                       ),
                       Text(winTxt,style: black12bold(),),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 5),
                     child: Text('Announce date  27 sep2021',style: black14regular(),),
                   ),
                 ],
               ) ,
             ),
           ),
         ),
       ],
     ),
   ),
 );


