import 'dart:async';

import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../modules/home/sleek_sliders.dart';
import '../../modules/home/horizontal_list.dart';

class ScrollEnimationState extends StatefulWidget {
   const ScrollEnimationState({Key? key}) : super(key: key);

  @override
  State<ScrollEnimationState> createState() => _ScrollEnimationStateState();
}

class _ScrollEnimationStateState extends State<ScrollEnimationState> {
  late AnimationController controller;

  late Animation<Offset> offset;

  int _currentPage = 0;

  late Timer _timer;

  final PageController _pageController = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );

  @override
  void initState() {
    // super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: getHeight(context)/3.7,
                width: getWidth(context),
                child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/first.jpg'), //images[0]
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/second.jpg'), //images[1]
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/third.png'), //images[2]
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: getHeight(context)/3.7,
                    width: getWidth(context),
                    //color:Colors.transparent,
                      color: const Color(0xff191919).withOpacity(.6),
                  ),
                  Positioned(
                    top: 10,
                    left: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.browse_gallery_outlined),
                        ),
                        backgroundColor: primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.volume_off_outlined),
                        ),
                        backgroundColor: primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 13,
                    left: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            'New Shopping',
                            style: white14bold(),
                          ),
                          sizedBoxh1,
                          Text(
                            'Experience!',
                            style: white22bold(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SmoothPageIndicator(
                          count: 3,
                          controller: _pageController,
                          effect: const ScrollingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.white,
                            dotWidth: 5,
                            dotHeight: 5,
                            spacing: 5.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                      Positioned(
                        bottom: -20,
                        left: 25,
                        child: SizedBox(
                          width: getWidth(context) / 4,
                          height: getHeight(context)/20,
                          child: defaultButton(context,
                              function: () {},
                              text: 'Shop & Win!',
                              color: primaryColor,
                              txtColor: defTextColor),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child:ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: getWidth(context),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getHeight(context) / 8.1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: defTextColor,
                                          //spreadRadius: 5,
                                          // blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Top Winners',
                                                style: black10bold(),
                                              ),
                                              const Spacer(),
                                              const CircleAvatar(
                                                radius: 10,
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/images/faceimg.jpg')),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.arrow_forward_ios),
                                              color: textGray)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 1,
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: defTextColor,
                                          offset: Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Final Winners',
                                                style: black10bold(),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.arrow_forward_ios),
                                                  color: textGray)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 10,
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/images/faceimg.jpg')),
                                              ),
                                              Text(
                                                'Yeoomah ahmed',
                                                style: TextStyle(
                                                    fontSize: 10, color: textGray),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection:Axis.horizontal ,
                          child: Row(
                            children: [
                              const HorizontalList(),sizedBoxh2,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('Closed soon' ,style: black18bold(), ),
                              Text('Hot Deals' ,style: black18bold(), ),
                              

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}

