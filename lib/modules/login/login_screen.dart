import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:deal_mart/modules/home/home_layout.dart';
import 'package:deal_mart/modules/intro/intro_screen.dart';
import 'package:deal_mart/modules/login/cubit/login_cubit.dart';
import 'package:deal_mart/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/language/app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../pin_code/pin_code_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
              CacheHelper.saveData(key: 'token', value:state.loginModel.data?.token).
              then((value){
                navigateAndFinish(context,const HomeLayout());
                snackBar(context: context,
                  message: 'Login Successful',
                  state: SnackBarStates.SUCCESS,
                );
              });
            }else{
              print(state.loginModel.message);
              snackBar(context: context,
                message: state.loginModel.message,
              state: SnackBarStates.ERROR,
              );
            }
          }

        },
        builder: (context, state) {
          return Padding(
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
                      navigateAndFinish(context,const HomeLayout());
                    },
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: secondColor,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedImage(context, 'assets/images/sign.png'),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            AppLocalization.of(context)!.translate('sign_in')!,
                            style: black22bold(),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalization.of(context)!
                                  .translate('sign_in_email_or_mobile_number')!,
                              style: black14regular(),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return AppLocalization.of(context)!.translate(
                                          'please_enter_your_email_address_or_phone_number')!;
                                    }
                                    return null;
                                  },
                                  txt: AppLocalization.of(context)!
                                      .translate('enter_your_email_or_mobile_number')!,
                                  focusedBorder: InputBorder.none,
                                  isClikable: true,
                                  disabledBorder: InputBorder.none),
                            ),
                            Text(
                              AppLocalization.of(context)!.translate('password')!,
                              style: black14regular(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: formFeild(
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
                                onSubmit:(value){
                                  if(formKey.currentState!.validate()){
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                } ,
                                txt: AppLocalization.of(context)!.translate('password')!,
                                isClikable: true,
                                suffixPressed: (){
                                  LoginCubit.get(context).changePasswordVisibility() ;},
                                isPassword:LoginCubit.get(context).isPassword ,
                                suffix:LoginCubit.get(context).suffix,
                              ),
                            ),
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

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ConditionalBuilder(
                                condition:state is! LoginLoadingState ,
                                builder: (context)=> defaultButton(
                                    context,borderColor: primaryColor,
                                    color: primaryColor,
                                    function: () {
                                      if(formKey.currentState!.validate()){
                                        LoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                         navigateAndFinish(context,const HomeLayout());

                                      }
                                   },
                                    text: AppLocalization.of(context)!
                                        .translate('sign_in')!,
                                    txtColor: defTextColor),
                                fallback: (context)=>const Center(child:  CircularProgressIndicator()) ,
                              ),
                            ),

                            defaultButton(context,borderColor: primaryColor,
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
                            //  const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

