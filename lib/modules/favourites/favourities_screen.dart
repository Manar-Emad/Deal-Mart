import 'package:deal_mart/modules/details/details_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../cart/cart_screen.dart';
import '../to_win/winners_screen.dart';
class FavouritiesScreen extends StatefulWidget {
  const FavouritiesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritiesScreen> createState() => _FavouritiesScreenState();
}

class _FavouritiesScreenState extends State<FavouritiesScreen> {
  int itemCount = 10;

  void toggleListContents() {
    setState(() {
      itemCount = itemCount == 0 ? 20 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar:itemCount>1 ? AppBar(
        centerTitle: true,
        backgroundColor: defTextColor,
        elevation: 0,
        title:const Text('Favourite',
        style: TextStyle(color: secondColor,
            //fontWeight: FontWeight.bold,
            fontSize: 18),
        ),
      ) :
      AppBar(
        backgroundColor: defTextColor,
        elevation: 0,
        title:const Text('Favourite',
          style: TextStyle(fontWeight: FontWeight.bold,color: secondColor,
            fontSize: 18),),
      ),
      body:itemCount > 1 ?
      SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
               ListView.builder(
                 shrinkWrap:true,
                 physics:const NeverScrollableScrollPhysics(),
                 itemCount: itemCount,
                   itemBuilder: (context, index) {
                return cardBuilder(context);
               })
              ],
            ),
          ),
        ):
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CircleAvatar(
             radius: 40,
            backgroundColor: defTextColor,
            child: Icon(Icons.favorite_border,color: textGray,size: 40,),
          ),
          sizedBoxh2,
         const Text('Your favourite empty',
            style: TextStyle(fontSize: 20,color: Colors.black45),),
        ],
      ),
      ),

    );
  }
}


Widget cardBuilder(context)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
  child: Container(
    height: getHeight(context)/4.8,
    width: getWidth(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
          color: defTextColor,
         // spreadRadius: 5,
          // blurRadius: 7,
          offset: Offset(
          0 , 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Image(image: const AssetImage('assets/images/pods.png'),
              height: getHeight(context)/7,
              width: getWidth(context)/5,
            ),
            sizedBoxw2,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  txtMaxLines1('XIAOMI Mi True Wireless Earbuds XIAOMI Mi True Wireless Earbuds '),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        txtMaxLines1('Get a chance to '),

                        const Text('win', style:  TextStyle(color: primaryColor,height: 1),),
                        txtMaxLines1('Honda accord 2021' ,),
                        txtMaxLinesB1(' 7999' ,),
                        Text(' EGP',style: grey12bold(),),
                      ],
                    ),
                  ) ,
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              /// TODO DELETE ITEM FROM FAV
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SizedBox(
                width: getWidth(context)/7,
                height: getHeight(context)/20,
                child: Row(
                  children: [
                    CircleAvatar(
                        child: Icon(
                            Icons.delete,
                            color: textGray,size: 15),radius: 15,
                      backgroundColor: const Color(0xffF4F4F4),
                    ),
                  const Spacer(),
                    Text('Delete',
                      style: TextStyle(
                          color: textGray,
                        fontSize: 10
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: getWidth(context)/3.4,
              height: getHeight(context)/21,
              child: cartButton(rightPadding:25 ,widget: const Spacer(),
                function: (){
                navigateTo(context,CartScreen());
                /// navigate to cartScreen
                //navigateTo(context,const CartScreen());
              },
                text: 'Add to cart',fontSize: 10,iconSize: 15,
                txtColor: defTextColor,
                color: primaryColor,
              ),
            ),
              sizedBoxh1,
          ],),
        ),

      ],
    ),
  ),
);