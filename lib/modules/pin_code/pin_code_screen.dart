import 'package:deal_mart/modules/pin_code/pass_recovery_screen.dart';
import 'package:deal_mart/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../app_localization.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/sizes.dart';
import '../../shared/styles/styles.dart';
import '../register/register_screen.dart';
class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  final String requiredNumber = '1234';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              navigateTo(context, const RegisterScreen());
            },
            icon: const Icon(
              Icons.close,
              color: secondColor,
            ),
          ),
        ),
        body:Center(
          child: Column(
            children: [
              Text( AppLocalization.of(context)!.translate('please_enter_the_OTP')!,style: black20bold(), ),
              sizedBoxh1,
              Text(  AppLocalization.of(context)!.translate('sent_to_confirm_the_phone_number')!,style: black20bold(),),
              sizedBoxh1,
              Text(  AppLocalization.of(context)!.translate('enter_the_code_sent_to_me')!,style:black18regular() ,),
              sizedBoxh1,
              InkWell(
                onTap: (){navigateTo(context, const PasswordRecoveryScreen());},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( AppLocalization.of(context)!.translate('resend')!,style:black14bold() ,),
                  sizedBoxw1,
                  const  Icon(Icons.refresh),
                  ],
                ),
              ),
              sizedBoxh2,
              PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged : (value){
                    print(value);
                  },
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: textGray,
                    activeColor: primaryColor,
                    selectedColor: primaryColor,
                  ),
                onCompleted: (value){
                    if (value==requiredNumber){
                      ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                            content: Text(AppLocalization.of(context)!.translate('pin_code_is_correct')!,),
                          )
                      );
                      print('validPin==$value');
                     navigateAndFinish(context,const PasswordRecoveryScreen());


                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: Text(AppLocalization.of(context)!.translate('pin_code_is_false_,_please_try_again')!,),
                          )
                      );
                      print('invalidPin');
                    }
                },

              ),

            ],
          ),
        ) ,
      ),
    ),
    );
  }
}
