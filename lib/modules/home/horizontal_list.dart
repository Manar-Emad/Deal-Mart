import 'package:flutter/material.dart';

import '../../shared/styles/sizes.dart';
import '../../shared/styles/styles.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const [
        Cateogry(
          color:  Color(0xffFFE5D1),
          img:'assets/images/caradds.png' ,
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
   const Cateogry({Key? key,
     required this.txtF,
     required this.txtS,
     required this.txtT,
     required this.color,
     required this.img,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: getHeight(context) / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Row(
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container( 
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(30) ,
                    ),
                    width:getWidth(context)/3.5 ,
                    height: getHeight(context)/5,
                    child:  Image(width: getWidth(context)/.5 ,
                        height: getHeight(context)/2.5,fit: BoxFit.fitWidth,
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
