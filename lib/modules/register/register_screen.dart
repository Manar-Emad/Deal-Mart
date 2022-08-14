import 'package:deal_mart/modules/intro/intro_screen.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/language/app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
import '../home/home_layout.dart';
import '../login/cubit/login_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // if(state is AppCreateUserSuccessState){
          //   ///TODO Replace each LoginModel to RegisterModel
          //   if(state.RegisterModel.status){
          //     print(state.RegisterModel.message);
          //     print(state.RegisterModel.data?.token);
          //     CacheHelper.saveData(key: 'token', value:state.RegisterModel.token).
          //     then((value){
          //       navigateAndFinish(context,const HomeLayout());
          //       snackBar(context: context,
          //         message: 'Login Successful',
          //         state: SnackBarStates.SUCCESS,
          //       );
          //     });
          //   }else{
          //     print(state.RegisterModel.message);
          //     snackBar(context: context,
          //       message: state.RegisterModel.message,
          //       state: SnackBarStates.ERROR,
          //     );
          //   }
          // }

        },
        builder: (context, state) {
          return Scaffold(
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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
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
                          controller: nameController,
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
                            LoginCubit.get(context).changePasswordVisibility() ;},
                          isPassword:LoginCubit.get(context).isPassword ,
                          suffix:LoginCubit.get(context).suffix,

                        ),
                        sizedBoxh5,
                        defaultButton(context,borderColor: primaryColor,
                          color: primaryColor,
                          txtColor: defTextColor,
                          function: () {
                            if(formKey.currentState!.validate()){
                              print('validate in register done========');
                              navigateAndFinish(context,const HomeLayout());
                            }
                          },
                          text: AppLocalization.of(context)!.translate('create')!,
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
