import 'package:deal_mart/modules/settings/settings_screen.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import 'change_pass_screen.dart';
class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Profile',
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
              navigateTo(context, AppCubit.get(context).changeBottom(4));
              /// navigate to settingsScreen
             // navigateTo(context, const SettingsScreen());
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: textGray,
                      child: CircleAvatar(
                        backgroundColor: defTextColor,
                        radius: 38,
                        child: Icon(
                          Icons.person,
                          color: textGray,size: 50,
                        ),
                      ),
                    ),
                  ),
                  TextButton(child: Text('Edite',style: prim12bold(),),
                    /// TODO ADD PHOTO
                    onPressed: (){},
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('Personal information',style: black12bold(),),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 7),
                        child: Text(
                          'Full Name',
                          style: black12bold(),
                        ),
                      ),
                      formFeild(
                        txt: 'name',
                        isClikable: true,
                        controller: TextEditingController(),
                        type: TextInputType.name,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom:7),
                        child: Text(
                          'Email',
                          style: black12bold(),
                        ),
                      ),
                      formFeild(
                        txt: 'email',
                        isClikable: true,
                        type: TextInputType.emailAddress,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your phone number';
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom:7),
                        child: Text(
                          'Phone number',
                          style: black12bold(),
                        ),
                      ),
                      formFeild(
                        txt: 'enter phone number',
                        isClikable: true,
                        type: TextInputType.phone,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your phone number';
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: defaultButton(
                                context,borderColor: secondColor,
                                function: () {
                                  navigateAndFinish(
                                    context,
                                     ChangePasswordScreen(),
                                  );
                                },
                                text: 'Change password',
                                //    AppLocalization.of(context)!.translate('create_account')!
                                txtColor: secondColor,

                              ),flex: 15,
                            ),
                            const Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Expanded(flex:15,
                              child: defaultButton(
                                context,borderColor: primaryColor,
                                function: () {
                                  if(formKey.currentState!.validate()){
                                  }
                                  navigateTo(context,  AppCubit.get(context).changeBottom(4));
                                  /// navigate to settingsScreen
                                 // navigateTo(context,  const SettingsScreen());
                                },
                                text:    'Save',
                                //AppLocalization.of(context)!.translate('sign_in')!,
                                txtColor:defTextColor ,
                                color: primaryColor,

                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),

        ],),
      ),
    );
  }
}
