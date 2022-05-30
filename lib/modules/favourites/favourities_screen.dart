import 'package:deal_mart/modules/winners/winners_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/styles.dart';
import '../cart/cart_screen.dart';
class FavouritiesScreen extends StatefulWidget {
  const FavouritiesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritiesScreen> createState() => _FavouritiesScreenState();
}

class _FavouritiesScreenState extends State<FavouritiesScreen> {
  int itemCount = 0;

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
      ) : AppBar(
        backgroundColor: defTextColor,
        elevation: 0,
        title:const Text('Favourite',
          style: TextStyle(fontWeight: FontWeight.bold,color: secondColor,
            fontSize: 18),),
      ),
      body:itemCount > 1 ?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
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
      ) : Center(child: Column(
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
  padding: const EdgeInsets.symmetric(vertical: 5),
  child: Container(
    height: getHeight(context)/4,
    width: getWidth(context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
          color: defTextColor,
         // spreadRadius: 5,
          // blurRadius: 7,
          offset: Offset(
          10 , 20), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Image(image: const AssetImage('assets/images/pods.png'),
              height: getHeight(context)/5,
              width: getWidth(context)/5,
            ),
            sizedBoxw2,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  txtMaxLines1('XIAOMI Mi True Wireless Earbuds XIAOMI Mi True Wireless Earbuds '),
                  sizedBoxh1,
                  Row(
                    children: [
                      txtMaxLines1('Get a chance to '),

                      TextButton(
                        onPressed: (){ navigateTo(context, const WinnerScreen());},
                        child: const Text('win', style:  TextStyle(color: primaryColor,height: 1),),),
                      txtMaxLines1('Honda accord 2021 7999' ,),
                      Text(' EGP',style: TextStyle(color: textGray),),
                    ],
                  ) ,
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: SizedBox(
              width: getWidth(context)/7,
              height: getHeight(context)/20,
              child: Row(
                children: [
                  CircleAvatar(
                      child: Icon(
                          Icons.delete,
                          color: textGray,size: 20),
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
            child: cartButton(function: (){
              navigateTo(context,const CartScreen());
            },
              text: 'Add to cart',
              txtColor: defTextColor,
              color: primaryColor,
            ),
          ),
            sizedBoxh1,
        ],),

      ],
    ),
  ),
);