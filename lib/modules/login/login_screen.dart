import 'package:deal_mart/modules/intro/intro_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../home/home_layout.dart';
import '../pin_code/pin_code_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                navigateTo(context, const IntroScreen());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: secondColor,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  AppLocalization.of(context)!.translate('skip')!,
                  style: const TextStyle(
                      color: secondColor, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  navigateAndFinish(context, const HomeScreen());
                },
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: secondColor,
              ),
            ],
          ),
          body: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizedImage(context, 'assets/images/sign.png'),
                  sizedBoxh2,
                  Text(
                    AppLocalization.of(context)!.translate('sign_in')!,
                    style: black22bold(),
                  ),
                  sizedBoxh2,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalization.of(context)!
                            .translate('sign_in_email_or_mobile_number')!,
                        style: black14regular(),
                      ),
                      sizedBoxh1,
                      formFeild(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppLocalization.of(context)!.translate(
                                  'please_enter_your_email_address_or_phone_number')!;
                            }
                          },
                          txt: AppLocalization.of(context)!
                              .translate('enter_your_email_or_mobile_number')!,
                          focusedBorder: InputBorder.none,
                          isClikable: true,
                          disabledBorder: InputBorder.none),
                      sizedBoxh1,
                      Text(
                        AppLocalization.of(context)!.translate('password')!,
                        style: black14regular(),
                      ),
                      sizedBoxh1,
                      formFeild(
                        controller: passwordController,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return AppLocalization.of(context)!
                                .translate('please_enter_your_password')!;
                          }
                        },
                        txt:
                            AppLocalization.of(context)!.translate('password')!,
                        isClikable: true,
                        obscureText: true,
                        suffix: const Icon(Icons.visibility),
                      ),
                      sizedBoxh1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell( onTap: (){navigateTo(context,const PinCodeVerificationScreen());},
                            child: Text(
                              AppLocalization.of(context)!
                                  .translate('forget_Password ?')!,
                              style: black14bold(),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxh3,
                      defaultButton(
                          color: primaryColor,
                          function: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(AppLocalization.of(context)!.translate('signed_in_successfully')!,),
                                )
                            );
                            navigateAndFinish(context, const HomeScreen());
                          },
                          text: AppLocalization.of(context)!
                              .translate('sign_in')!,
                          txtColor: defTextColor),
                      sizedBoxh2,
                      defaultButton(
                          function: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                  content: Text(AppLocalization.of(context)!
                                      .translate('lets_create_a_new_account')!,),
                                )
                            );
                            navigateAndFinish(context, const RegisterScreen());
                            },
                          text: AppLocalization.of(context)!
                              .translate('create_account')!,
                          txtColor: primaryColor),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: secondColor,
                    height: MediaQuery.of(context).size.height * 0.007,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
