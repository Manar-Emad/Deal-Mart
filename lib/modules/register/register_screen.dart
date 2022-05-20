import 'package:deal_mart/modules/intro/intro_screen.dart';
import 'package:deal_mart/modules/pin_code/pin_code_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../home/home_layout.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.of(context)!.translate('create_account')!,
                      style: black22bold(),
                    ),
                    sizedBoxh3,
                    Text(
                      AppLocalization.of(context)!.translate('full_name')!,
                      style: black18regular(),
                    ),
                    sizedBoxh2,
                    formFeild(
                      txt: AppLocalization.of(context)!
                          .translate('enter_your_full_name')!,
                      isClikable: true,
                      controller: TextEditingController(),
                      type: TextInputType.name,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      validate: (value) {
                        if (value.isEmpty) {
                          return AppLocalization.of(context)!
                              .translate('please_enter_your_name');
                        }
                      },
                    ),
                    sizedBoxh2,
                    Text(
                      AppLocalization.of(context)!.translate('email')!,
                      style: black18regular(),
                    ),
                    sizedBoxh1,
                    formFeild(
                      txt: AppLocalization.of(context)!
                          .translate('enter_your_email')!,
                      isClikable: true,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      validate: (value) {
                        if (value.isEmpty) {
                          return AppLocalization.of(context)!.translate(
                              'please_enter_your_email_address_or_phone_number');
                        }
                      },
                    ),
                    sizedBoxh2,
                    Text(
                      AppLocalization.of(context)!.translate('phone_number')!,
                      style: black18regular(),
                    ),
                    sizedBoxh1,
                    formFeild(
                      txt: AppLocalization.of(context)!
                          .translate('enter_phone_number')!,
                      isClikable: true,
                      type: TextInputType.phone,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      validate: (value) {
                        if (value.isEmpty) {
                          return AppLocalization.of(context)!
                              .translate('please enter your phone number');
                        }
                      },
                    ),
                    sizedBoxh2,
                    Text(
                      AppLocalization.of(context)!.translate('password')!,
                      style: black18regular(),
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
                              .translate('please_enter_your_password');
                        }
                      },
                      txt: AppLocalization.of(context)!.translate('password')!,
                      isClikable: true,
                      obscureText: true,
                      suffix: const Icon(Icons.visibility),
                    ),
                    sizedBoxh5,
                    defaultButton(
                      color: primaryColor,
                      txtColor: defTextColor,
                      function: () {
                        navigateAndFinish(context, const HomeScreen());
                      },
                      text: AppLocalization.of(context)!.translate('create')!,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          color: secondColor,
                          height: MediaQuery.of(context).size.height * 0.007,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
