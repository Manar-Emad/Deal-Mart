import 'package:deal_mart/modules/settings/profile_screen.dart';
import 'package:deal_mart/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/language/app_localization.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
class ChangePasswordScreen extends StatefulWidget {
   ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Change password',
          style: TextStyle(
            color: secondColor,
          ),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: secondColor,
            ),
            onPressed: () {
              navigateTo(context,  ProfileScreen());
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Current password',
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
                        txt:'please enter your current password',
                        isClikable: true,
                        suffixPressed: (){
                          setState((){
                            isPassword=!isPassword ;
                          });},
                        isPassword: isPassword,
                        suffix:isPassword? Icons.visibility:Icons.visibility_off_outlined,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 10),
                        child: Text(
                          'New password',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: defaultButton(context,
                            function: (){
                              if(formKey.currentState!.validate()){
                                print('validate done');
                              }
                          navigateTo(context, ProfileScreen());},
                            text: 'Save',
                            borderColor: primaryColor,
                            color: primaryColor,
                            txtColor: defTextColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
