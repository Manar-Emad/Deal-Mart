import 'package:deal_mart/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../../shared/styles/styles.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Cateogry(
          color:  Color(0xffFFE5D1),
          img:'assets/images/caradds.png' ,
          txtF: 'Win a car ',
          txtS: 'Honda Aquard 2021',
          txtT:'and buy iphone x' ,

          widget:  SizedBox(
            width: getWidth(context) / 6,
            height: getHeight(context)/20,
            child: defaultButton(context,function: (){}, text: 'Earn',txtColor: secondColor,color: Colors.red),
          ),
        ),
        Cateogry(
          color:  Color(0xffFFE5D1),
          img:'assets/images/caradds.png' ,
          txtF: 'Win a car ',
          txtS: 'Honda Aquard 2021',
          txtT:'and buy iphone x' ,
        ),
        Cateogry(
          color:  Color(0xffFFE5D1),
          img:'assets/images/Earphone.png' ,
          txtF: 'Win a car ',
          txtS: 'Honda Aquard 2021',
          txtT:'and buy iphone x' ,
        ),
        Cateogry(
          color:  Color(0xffFFE5D1),
          img:'assets/images/caradds.png' ,
          txtF: 'Win a car ',
          txtS: 'Honda Aquard 2021',
          txtT:'and buy iphone x' ,
        ),
        Cateogry(
          color:  Color(0xffFFE5D1),
          img:'assets/images/Earphone.png' ,
          txtF: 'Win a car ',
          txtS: 'Honda Aquard 2021',
          txtT:'and buy iphone x' ,

        ),
      ],
    );
  }
}




class Cateogry extends StatelessWidget {
  final String txtF;
  final String txtS;
  final String txtT;
  final String img;
  final Color color;

  Widget? widget;
   Cateogry({Key? key,
     required this.txtF,
     required this.txtS,
     required this.txtT,
     required this.color,
     required this.img,
     this.widget,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: getHeight(context) / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            txtF,
                            style: black22bold(),
                          ),
                          Text(
                            txtS,
                            style: black18regular(),
                          ),
                          Text(
                            txtT,
                            style: black18regular(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 2 ,right: 2 ,bottom: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(30) ,
                    ),
                    width:getWidth(context)/3.5 ,
                    height: getHeight(context)/5,
                    child:  Image(width: getWidth(context)/.5 ,
                        height: getHeight(context)/2,
                      fit: BoxFit.fitWidth,
                        image:  AssetImage(
                           img),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
