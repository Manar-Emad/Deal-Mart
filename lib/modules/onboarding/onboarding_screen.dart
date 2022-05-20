import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../intro/intro_screen.dart';

class BoardModel {
  final String image;
  final String title;
  final String body;

  BoardModel({required this.image, required this.title, required this.body});
}

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late List<BoardModel> list;

  @override
  void initState() {
    super.initState();
  }

  var isLast = false;
  final controller = PageController();

  // void submit(context) {
  //   navigateAndFinish(
  //     context,
  //     const IntroScreen(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    list = [
      BoardModel(
        image: 'assets/images/onboard1.png',
        title:
        AppLocalization.of(context)!
            .translate('explore_the_app_start_wining_by_order_as_many_products_you_can_shop_more_and_by_more')!,
        body: '',
      ),
      BoardModel(
        image: 'assets/images/onboard2.png',
        title:

        AppLocalization.of(context)!.
        translate('every_purchase_on_product_gives_you_a_single_complementary_ticket_with_id_number_on_it_to_enter_the_draw')!,
        body: '',
      ),
      BoardModel(
        image: 'assets/images/onboard3.png',
        title:
        AppLocalization.of(context)!
            .translate('we_will_announce_winners _on_the_day_the_draw_will_be_held_which_is_normally_on_27th_and_28th_every_month')!,
        body: '',
      ),

    ];
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,

            actions: [
          TextButton( child: Text(
            AppLocalization.of(context)!.translate('skip')!,
            style:const TextStyle(
                color: secondColor,
                fontWeight: FontWeight.bold)
            ,),
            onPressed: () {
           navigateAndFinish(context, const IntroScreen());
          }, ),
             const Icon(Icons.arrow_forward_ios,color: secondColor,),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: PageView.builder(
                    physics:const BouncingScrollPhysics(),
                    onPageChanged: (int index) {
                      if (index == (list.length - 1) && !isLast) {
                        setState(() => isLast = true);
                      } else if (isLast) {
                        setState(() => isLast = false);
                      }
                    },
                    controller: controller,
                    itemCount: list.length,
                    itemBuilder: (context, i) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child:sizedImage(context,'assets/images/logo.png'),),
                        sizedBoxh5,
                        Expanded(
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height:MediaQuery.of(context).size.height * 0.3,
                            image: AssetImage(
                              list[i].image,
                            ),
                          ),
                        ),
                        sizedBoxh1,
                        Text(
                          list[i].title,
                          style: const TextStyle(
                            fontSize:16.0,
                            color: secondColor,
                          ),
                        ),
                        sizedBoxh1,
                        Text(
                          list[i].body,
                          style: black14bold(),
                        ),
                        SmoothPageIndicator(
                          count: list.length,
                          controller: controller,
                          effect:const ScrollingDotsEffect(
                            dotColor: Color(0xffFFA65F),
                            activeDotColor: primaryColor,
                            dotWidth: 5,
                            dotHeight: 5,
                            spacing: 5.0,
                          ),
                          // effect: const ExpandingDotsEffect(
                          //   dotColor: Color(0xffFFA65F),
                          //   activeDotColor: primaryColor,
                          //   dotHeight: 10,
                          //   expansionFactor: 4,
                          //   dotWidth: 10,
                          //   spacing: 5.0,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /// BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(color: primaryColor ),
                    borderRadius: BorderRadius.circular(30.0),

                  ),
                  width: double.infinity,
                  height: 40,
                  child:TextButton(
                    onPressed: () {
                      if (isLast) {
                        print(  "all ighrt");
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                        navigateAndFinish(context, IntroScreen());
                        print(  "all cccccc");
                      // submit(context);
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Text(
                      isLast ?
                       AppLocalization.of(context)!.translate('next')! : AppLocalization.of(context)!.translate('start')! ,
                      style:white18regular(),),
                  ),

                ),
              ),
              sizedBoxh2,
              /// BLACK CONTAINER
              Container(color: secondColor,alignment: Alignment.bottomCenter,
                height:3,
                width:100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
