import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    viewportFraction:1/2 ,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('assets/images/logo.png'),//images[0]
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('assets/images/logo.png'),//images[1]
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('assets/images/logo.png'),//images[2]
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}