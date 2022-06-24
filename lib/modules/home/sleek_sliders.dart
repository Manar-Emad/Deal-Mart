import 'package:flutter/material.dart';
import '../../shared/styles/sizes.dart';

class SleekSliders extends StatelessWidget {
  SleekSliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: getHeight(context) / 8,
      child: Padding(
        padding: const EdgeInsets.only(top: 5,bottom: 10,left: 5),
        child: Row(
          children: [
           // SleekSliders(key: ),
            CircleAvatar(
              radius: 5,
              backgroundColor: Colors.red,
              child: Column(
                children: const [
                  Image(
                    image: AssetImage('assets/images/Component.png'),
                  ),
                  Text(
                    '51/100 sold By Watch Casio Get an iphone',
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
