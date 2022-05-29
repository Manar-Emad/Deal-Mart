import 'package:flutter/cupertino.dart';


getHeight(context){
  return MediaQuery.of(context).size.height;
}

getWidth(context){
  return MediaQuery.of(context).size.width;
}



SizedBox sizedBoxh1=const SizedBox(height: 10,);
SizedBox sizedBoxh2=const SizedBox(height: 20,);
SizedBox sizedBoxh3=const SizedBox(height: 30,);
SizedBox sizedBoxh4=const SizedBox(height: 40,);
SizedBox sizedBoxh5=const SizedBox(height: 50,);
SizedBox sizedBoxw1=const SizedBox(height: 10,);
SizedBox sizedBoxw2=const SizedBox(height: 20,);
SizedBox sizedBoxw3=const SizedBox(height: 30,);
SizedBox sizedBoxw4=const SizedBox(height: 40,);
SizedBox sizedBoxw5=const SizedBox(height: 50,);



// import 'package:flutter/material.dart';
// class Home extends StatelessWidget {
//   var size,height,width;
//
//   @override
//   Widget build(BuildContext context) {
//
//     // getting the size of the window
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Geeks For Geeks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Container(
//         color: Colors.yellow,
//         height: height/2,//half of the height size
//         width: width/2,//half of the width size
//       ),
//     );
//   }
// }
