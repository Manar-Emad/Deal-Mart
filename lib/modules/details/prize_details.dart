import 'package:deal_mart/modules/cart/cart_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class PrizeDetails extends StatefulWidget {
  const PrizeDetails({Key? key}) : super(key: key);

  @override
  State<PrizeDetails> createState() => _PrizeDetailsState();
}

class _PrizeDetailsState extends State<PrizeDetails> {
  bool isFav = true;
  double num = 145;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  child: isFav
                      ? const Icon(
                    Icons.favorite_border,
                    color: secondColor,
                  )
                      : const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  backgroundColor: defTextColor,
                ),
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
              ),
              sizedBoxw1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.backup_outlined,
                      color: secondColor,
                    ),
                    backgroundColor: defTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: cardProductBuilder(
            context,
            getHeight(context) / 10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children:  [
                      containerBorder(context,
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('149',style: black14bold(),),
                          ),
                          Text('Sold',
                            style: TextStyle(color: textGray,fontSize: 10,fontWeight: FontWeight.bold),),
                        ],),
                      ),
                      Expanded(
                        child: Slider(

                            value: num,
                            min: 145,
                            max: 200,
                            divisions: 1,
                            label: num.toString(),
                            activeColor: primaryColor,
                            inactiveColor: textGray,
                            onChanged: (value) {
                              setState(() {
                                num = value;
                              });
                            }),
                      ),
                      containerBorder(context,
                        Row(children:const [
                          Padding(
                            padding:  EdgeInsets.all(5.0),
                            child: Text('out of',style: TextStyle(color: Colors.black26,fontSize: 10,
                                fontWeight: FontWeight.bold),),
                          ),
                          Text('200',style: TextStyle(color:  Colors.black26,fontSize: 10,
                              fontWeight: FontWeight.bold),
                          ),
                        ],),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'laptop dell z21 find dweduw dwuw',
                    style: black14bold(),

                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Overview',
            style: black14bold(),
          ),
        ),
        cardProductBuilder(
          context,
          getHeight(context) / 8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'
                      ' The point of using Lorem Ipsum is that it has a more-or-less normal distribution',
                  maxLines: 4,
                  style: TextStyle(color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: getHeight(context)/5,),
        defaultButton(context,borderColor: primaryColor,
          function: () {
            navigateTo(context, const CartScreen());
          },
          text: 'Add to Card',
          color: primaryColor,
          txtColor: defTextColor,
        ),
      ],
    );
  }
}

Widget cardProductBuilder(
    context,
    height,
    Widget widget,
    ) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Container(
        height: height,
        width: getWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: defTextColor,
              // spreadRadius: 5,
              // blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: widget,
      ),
    );

Widget smallContainer(
    height,
    width,
    context,
    Widget widget,
    Color color,
    Function()? ontap) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height,
          width:width ,
          //height: getHeight(context) / 12,
          //width: getWidth(context) / 5.7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: widget,
        ),
      ),
    );

Widget containerBorder(context,Widget widget)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
  child:   Container(
    height: getHeight(context)/30,
    width: getWidth(context)/8,
    decoration: BoxDecoration(
      border: Border.all(color:Colors.grey,width: .5 ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget,
  ),
);