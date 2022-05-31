import 'package:country_list_pick/country_list_pick.dart';
import 'package:deal_mart/modules/login/login_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../app_localization.dart';
import '../onboarding/onboarding_screen.dart';
import '../register/register_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isSelected = true;
  bool selectIcon = false;
  bool visible =false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              navigateTo(context, const OnBoardScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: secondColor,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: sizedImage(context,'assets/images/logo.png'),
              ),
              sizedBoxh2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("welcome",
                  //  AppLocalization.of(context)!.translate('welcome')!,
                    style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  sizedBoxh1,
                  Text('select_the_country_and_language_of_the_application',
                  //  AppLocalization.of(context)!.translate('select_the_country_and_language_of_the_application')!,
                    style:const TextStyle(
                        color: secondColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  sizedBoxh3,
                  formFeild(
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isClikable: false,
                      suffix:const Icon(Icons.keyboard_arrow_down),
                      prefix: Icons.flag,
                      txt: 'select_country',
                      //AppLocalization.of(context)!.translate('select_country')!,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return SizedBox(
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topCenter,
                                      color: textGray,
                                      height: MediaQuery.of(context).size.height * 0.007,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                    ),

                                    /// Country List Picker
                                    CountryListPick(
                                      appBar: AppBar(
                                        backgroundColor: primaryColor,
                                        title:Text("pick_your_country",
                                       //   AppLocalization.of(context)!.translate('pick_your_country')!,
                                        ),

                                      ),
                                      theme: CountryTheme(
                                        isShowFlag: true,
                                        isShowTitle: true,
                                        isShowCode: true,
                                        isDownIcon: true,
                                        showEnglishName: true,
                                        labelColor: primaryColor,
                                      ),
                                    //  initialSelection: '+62',
                                      // or
                                       initialSelection: 'US',
                                      onChanged: (CountryCode code) {
                                        print(code.name);
                                        print(code.code);
                                        print(code.dialCode);
                                        print(code.flagUri);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                  sizedBoxh2,
                  formFeild(
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    isClikable: false,
                      suffix:const Icon(Icons.keyboard_arrow_down),
                      prefix: Icons.language,
                      txt:  'select_language',
                      //AppLocalization.of(context)!.translate('select_language')!,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return SizedBox(
                                height: 200,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topCenter,
                                      color: textGray,
                                      height: MediaQuery.of(context).size.height * 0.007,
                                      width: MediaQuery.of(context).size.width * 0.3,
                                    ),
                                    /// ////////////////////////////////////////////////
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         TextButton.icon(onPressed: (){
                                           setState(() {
                                             selectIcon ;
                                           });
                                         },
                                           label: Text( 'english'
                                            // AppLocalization.of(context)!.translate('english')!
                                             ,style: TextStyle(color: textGray),),
                                           icon: Icon(Icons.check_circle_outline,color: selectIcon? textGray : primaryColor,), ),
                                      //  snackBar(context ,txt: 'English is chosen'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton.icon(onPressed: (){
                                          setState(() {
                                            selectIcon ;
                                          });
                                        },
                                          label: Text('arabic'
                                            //AppLocalization.of(context)!.translate('arabic')!
                                            ,style: TextStyle(color: textGray),),
                                          icon: Icon(Icons.check_circle_outline,color: selectIcon? textGray : primaryColor,), ),
                                       // snackBar(context ,txt: 'Arabic is chosen'),

                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                  Row(
                    children: [
                      Expanded(
                          child: defaultButton(
                            context,
                        function: () {
                          setState(() {
                            isSelected ;
                          });
                          navigateAndFinish(
                            context,
                            const RegisterScreen(),
                          );
                        },
                        text: 'create account',
                    //    AppLocalization.of(context)!.translate('create_account')!,
                            txtColor: primaryColor,
                            color: defTextColor,
                      ),flex: 15,
                      ),
                      const Expanded(child: SizedBox(width: 1,),flex: 1,),
                      Expanded(flex:15,
                          child: defaultButton(
                            context,
                              function: () {
                               navigateTo(context, LoginScreen());
                              },
                              text:    'sign in',
                              //AppLocalization.of(context)!.translate('sign_in')!,
                            txtColor:defTextColor ,
                            color: primaryColor,

                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: secondColor,
                  height: MediaQuery.of(context).size.height * 0.007,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
