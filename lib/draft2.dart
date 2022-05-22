import 'package:deal_mart/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ImageList {
  final String image;
  ImageList({required this.image,});
}


class Draft extends StatelessWidget {
   Draft({Key? key}) : super(key: key);

  final controller = PageController(
    viewportFraction:1 ,
    initialPage: 0,
  );
  var isLast = false;

  List listimgs = [
    ImageList(
      image: 'assets/images/first.jpg',

    ),
    ImageList(
      image: 'assets/images/second.jpg',

    ),
    ImageList(
      image: 'assets/images/third.png',

    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) =>Container(
                  height: 300,
                  width: 300,
                  color: primaryColor,
                  padding:const EdgeInsets.all(10),
                  child: Center(
                  //     child:
                  // Text('card$index',),
                    child: Image(
                      //width: double.infinity,
                      image: AssetImage(
                        listimgs[index].image,
                      ),
                    ),
                  ),

                ),
            ),
          ),
        ],
      ),
    );
  }
}
