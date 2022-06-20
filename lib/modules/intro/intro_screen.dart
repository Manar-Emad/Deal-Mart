import 'package:country_list_pick/country_list_pick.dart';
import 'package:deal_mart/modules/login/login_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/language/app_localization.dart';
import '../onboarding/onboarding_screen.dart';
import '../register/register_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool selectIcon = false;
  // bool showIcon=false;
  int showIcon = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  child: sizedImage(context, 'assets/images/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome",
                      //  AppLocalization.of(context)!.translate('welcome')!,
                      style: prim24bold(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'select_the_country_and_language_of_the_application',
                        //  AppLocalization.of(context)!.translate('select_the_country_and_language_of_the_application')!,
                        style: black18bold(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: formFeild(
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          isClikable: false,
                          suffix:
                            Icons.keyboard_arrow_down,suffixColor: secondColor,
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
                                    height: getHeight(context) / 2.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 20),
                                          child: Center(
                                            child: SizedBox(
                                              width: getWidth(context) / 3,
                                              child: defaultSeparator(
                                                  separatorColor),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getHeight(context) / 11,
                                          width: getWidth(context) / 5,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/egypt (1).png'),
                                                ),
                                              ),
                                              Text(
                                                'Egypt',
                                                style: black14bold(),
                                              )
                                            ],
                                          ),
                                        ),

                                        /// Country List Picker
                                        // CountryListPick(
                                        //   appBar: AppBar(
                                        //     backgroundColor: primaryColor,
                                        //     title:Text("pick_your_country",
                                        //    //   AppLocalization.of(context)!.translate('pick_your_country')!,
                                        //     ),
                                        //
                                        //   ),
                                        //   theme: CountryTheme(
                                        //     isShowFlag: true,
                                        //     isShowTitle: true,
                                        //     isShowCode: true,
                                        //     isDownIcon: true,
                                        //     showEnglishName: true,
                                        //     labelColor: primaryColor,
                                        //   ),
                                        // //  initialSelection: '+62',
                                        //   // or
                                        //    initialSelection: 'US',
                                        //   onChanged: (CountryCode code) {
                                        //     print(code.name);
                                        //     print(code.code);
                                        //     print(code.dialCode);
                                        //     print(code.flagUri);
                                        //   },
                                        // ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: formFeild(
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          isClikable: false,
                          suffix:
                            Icons.keyboard_arrow_down,
                          suffixColor: secondColor,
                          prefix: Icons.language,
                          txt: 'select_language',
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
                                    height: getHeight(context) / 2.4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 20),
                                          child: Center(
                                            child: SizedBox(
                                              width: getWidth(context) / 3,
                                              child: defaultSeparator(
                                                  separatorColor),
                                            ),
                                          ),
                                        ),

                                        /// Language Picker
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    showIcon == 0;
                                                  });
                                                },
                                                child: const Text('english',
                                                    style: TextStyle(
                                                        color: secondColor))),
                                            showIcon == 0
                                                ? const Icon(
                                                    Icons.check_circle_outline,
                                                    color: secondColor,
                                                  )
                                                : const SizedBox(
                                                    width: 1,
                                                  ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    showIcon == 1;
                                                  });
                                                },
                                                child: const Text('english',
                                                    style: TextStyle(
                                                        color: secondColor))),
                                            showIcon == 1
                                                ? const Icon(
                                                    Icons.check_circle_outline,
                                                    color: secondColor,
                                                  )
                                                : const SizedBox(
                                                    width: 1,
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(
                  children: [
                    Expanded(
                      child: defaultButton(
                        context, borderColor: primaryColor,
                        function: () {
                          navigateAndFinish(
                            context,
                            const RegisterScreen(),
                          );
                        },
                        text: 'create account',
                        //    AppLocalization.of(context)!.translate('create_account')!,
                        txtColor: primaryColor,
                        color: defTextColor,
                      ),
                      flex: 15,
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 15,
                      child: defaultButton(
                        context, borderColor: primaryColor,
                        function: () {
                          navigateTo(context,  LoginScreen());
                        },
                        text: 'sign in',
                        //AppLocalization.of(context)!.translate('sign_in')!,
                        txtColor: defTextColor,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(context)/8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
