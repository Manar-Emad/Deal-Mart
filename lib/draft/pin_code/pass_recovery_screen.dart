import 'package:deal_mart/app_localization.dart';
import 'package:deal_mart/shared/styles/sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
         /// navigateTo(context, const RegisterScreen());
        },
        icon: const Icon(
          Icons.close,
          color: secondColor,
        ),
      ),
    ),
      // body: Center(
      //   child: Column(
      //   children: [
      //     Text( 'password_recovery_by_mobile_number',
      //     //  AppLocalization.of(context)!.translate('password_recovery_by_mobile_number')!,
      //       style: black20bold(), ),
      //     sizedBoxh2,
      //     Container(
      //        //height:  MediaQuery.of(context).size.height * 0.1,
      //       width: double.infinity,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //        boxShadow: [
      //       BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 5,
      //       blurRadius: 7,
      //       offset:const Offset(0, 3), // changes position of shadow
      //     ),
      //   ],
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.fromLTRB(2, 3, 2, 5),
      //         child: Column(
      //           children: [
      //           const  Text( 'phone_number'
      //              // AppLocalization.of(context)!.translate('phone_number')!,
      //             ),
      //             sizedBoxh1,
      //             // formFeild(
      //             //   txt:'enter phone number',
      //             //   //AppLocalization.of(context)!.translate('enter_phone_number')!,
      //             //   isClikable: true,
      //             //   type: TextInputType.phone,
      //             //   focusedBorder: InputBorder.none,
      //             //   disabledBorder: InputBorder.none,
      //             //   validate: (value) {
      //             //     if (value.isEmpty) {
      //             //       return 'please_enter_your_phone_number' ;
      //             //         // AppLocalization.of(context)!.translate('please_enter_your_phone_number');
      //             //     }
      //             //   },
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     sizedBoxh2,
      //     defaultButton(
      //       color: primaryColor,txtColor: defTextColor,
      //         function: (){
      //        /// navigateTo(context,const HomeLayout());
      //         },
      //         text:"confirm",
      //  //       AppLocalization.of(context)!.translate('confirm')!
      //            ),
      //   ],
      //   ),
      // ),
    );
  }
}
