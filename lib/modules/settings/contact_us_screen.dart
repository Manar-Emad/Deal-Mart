import 'package:deal_mart/modules/settings/settings_screen.dart';
import 'package:deal_mart/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/app_cubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/language/app_localization.dart';
import '../../shared/styles/colors.dart';
class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defTextColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Contact us',
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
              navigateTo(context,  AppCubit.get(context).changeBottom(4));
              /// navigate to settingsScreen
             // navigateTo(context, const SettingsScreen());
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Help Center',style: black20bold(),),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Text('send us a message',style: black10bold(),),
              ),
              defContainer(context, Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: formFeild(
                    txt: 'Type send us a message',
                    isClikable: true,
                    controller: TextEditingController(),
                    type: TextInputType.name,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please_enter_your_message';
                     //     AppLocalization.of(context)!.translate('please_enter_your_message');
                      }
                    },
                  ),
                  //Text('Type Send us a message',style: grey12regular(),),
                ),
              ],),
              color: scaffoldColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: defaultButton(context,
                    function: (){
                      if(formKey.currentState!.validate()){
                      }
                      navigateTo(context,  AppCubit.get(context).changeBottom(4));
                      /// navigate to settingsScreen
                 // navigateTo(context, const SettingsScreen());
                      },
                    text: 'Send',
                    borderColor: primaryColor,
                    txtColor: defTextColor,
                    color: primaryColor),
              ),
          ],),
        ),
      ),
    );
  }
}
