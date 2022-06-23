import 'package:deal_mart/modules/intro/intro_screen.dart';
import 'package:deal_mart/modules/pin_code/pin_code_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/language/app_localization.dart';
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
  bool isPassword=true;
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
                  navigateAndFinish(context,AppCubit.get(context).changeBottom(0) );
                  /// navigate to homeScreen
                  //navigateAndFinish(context, const HomeScreen());
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),

                      child: Text(
                        AppLocalization.of(context)!.translate('create_account')!,
                        style: black22bold(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),

                      child: Text(
                        AppLocalization.of(context)!.translate('full_name')!,
                        style: black18regular(),
                      ),
                    ),

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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),

                      child: Text(
                        AppLocalization.of(context)!.translate('email')!,
                        style: black18regular(),
                      ),
                    ),

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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),

                      child: Text(
                        AppLocalization.of(context)!.translate('phone_number')!,
                        style: black18regular(),
                      ),
                    ),

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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        AppLocalization.of(context)!.translate('password')!,
                        style: black18regular(),
                      ),
                    ),
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
                        return null;
                      },
                      txt: AppLocalization.of(context)!.translate('password')!,
                      isClikable: true,
                      suffixPressed: (){
                        setState((){
                          isPassword=!isPassword ;
                        });},
                      isPassword: isPassword,
                      suffix:isPassword? Icons.visibility:Icons.visibility_off_outlined,
                    ),
                    sizedBoxh5,
                    defaultButton(context,borderColor: primaryColor,
                      color: primaryColor,
                      txtColor: defTextColor,
                      function: () {
                        if(formKey.currentState!.validate()){
                          print('validate in register done========');
                        }
                        navigateAndFinish(context,AppCubit.get(context).changeBottom(0));
                        /// navigate to homeScreen
                      //  navigateAndFinish(context, const HomeScreen());
                      },
                      text: AppLocalization.of(context)!.translate('create')!,
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
