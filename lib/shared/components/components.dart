import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/app_cubit/app_cubit.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icons.dart';
import '../../app_localization.dart';
import '../../bottom_nav_bar.dart';
import '../../modules/intro/intro_screen.dart';
import '../styles/sizes.dart';
import '../styles/styles.dart';

class LanguageModel {
  final String language;
  final String code;

  LanguageModel({
    required this.language,
    required this.code,
  });
}

List<LanguageModel> languageList = [
  LanguageModel(
    language: 'English',
    code: 'en',
  ),
  LanguageModel(
    language: 'العربية',
    code: 'ar',
  ),
];

Widget languageItem(
  LanguageModel model, {
  context,
  index,
}) =>
    InkWell(
      onTap: () {
        ///      AppCubit.get(context).changeSelectedLanguage(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                model.language,
              ),
            ),
            //  if (AppCubit.get(context).selectedLanguage[index])
            const Icon(
              IconBroken.Arrow___Right_Circle,
            ),
          ],
        ),
      ),
    );

/// Sized Image
Widget sizedImage(context, img) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Image(
        image: AssetImage(img),
      ),
    );

/// AppBar
getAppBar(context,
    {String? txt,
    IconData? iconBack,
    Widget? widgetBack,
    IconData? iconTo,
    Widget? widgetTo}) {
  AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        navigateTo(context, widgetBack);
      },
      icon: Icon(
        iconBack!,
        color: secondColor,
      ),
    ),
    actions: [
      TextButton(
        child: Text(
          txt!,
          // AppLocalization.of(context)!.translate('skip')!,
          style:
              const TextStyle(color: secondColor, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          navigateAndFinish(context, widgetTo);
        },
      ),
      Icon(
        iconTo!,
        color: secondColor,
      ),
    ],
  );
}

/// Separator divider
Widget defaultSeparator() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

///Button
Widget defaultButton(BuildContext context, {
  required Function()? function,
  required String text,
  Widget? child,
  Color? color,
  Color? txtColor,
}) =>
    Container(
      height: getHeight(context)/13,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: primaryColor),
        //  color: buttonColor,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: MaterialButton(
        child: Text(
          text,
          style: (TextStyle(
              color: txtColor, fontWeight: FontWeight.bold, fontSize: 14)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5),
        onPressed: function,
      ),
    );

///Navigate.push
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

///Navigate And Remove
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        // return false,
        (route) {
      return false;
    });

Widget formFeild({
  Widget? suffix,
  IconData? prefix,
  required String txt,
  required bool isClikable,
  dynamic validate,
  Function()? onTap,
  TextEditingController? controller,
  TextInputType? type,
  VoidCallback? suffixPressed,
  InputBorder? focusedBorder,
  InputBorder? disabledBorder,
  Function(dynamic val)? onSaved,
  bool? obscureText,
}) =>
    MaterialButton(
      onPressed: onTap,
      child: TextFormField(
        onSaved: onSaved,
        enabled: isClikable,
        controller: controller,
        validator: validate,
        keyboardType: type,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: focusedBorder,
          disabledBorder: disabledBorder,
          hintTextDirection: TextDirection.ltr,
          // focusedBorder:  InputBorder.none,
          // disabledBorder: InputBorder.none,
          prefixIconColor: primaryColor,
          suffixIconColor: secondColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: txt,
          hintStyle: TextStyle(color: textGray),
          filled: true,
          fillColor: formContainer,
          suffixIcon: suffix,
          prefixIcon: Icon(
            prefix,
            color: primaryColor,
          ),
        ),
      ),
    );

/// Cart Button

Widget cartButton({
  required Function()? function,
   String? text,
  Widget? child,
  Color? color,
  Color? txtColor,
}) =>
    Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: primaryColor),
          //  color: buttonColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: MaterialButton(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart,
                  color: defTextColor,size: 15,),
               const Spacer(),
                Text(
                  text!,
                  style: (TextStyle(
                      color: txtColor, fontWeight: FontWeight.bold,
                      fontSize: 10)),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(5),
          onPressed: function,
        ),
      ),
    );

