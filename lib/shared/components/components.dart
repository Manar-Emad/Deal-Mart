import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/app_cubit/app_cubit.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icons.dart';

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

/// Separator divider
Widget defaultSeparator() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

///Button
Widget defaultButton({
  required Function()? function,
  required String text,
  Widget? child,
  Color? color,
  Color? txtColor,
}) =>
    Container(
      height: 40.0,
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
              color: txtColor, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5),
        onPressed: function,
      ),
    );

/// SNACKBAR
// Widget snackBar ( context , {required txt})=> SnackBar(
//   content: Text(txt ,style:const TextStyle(color: defTextColor),),
//   duration:const Duration(seconds: 1),
//   backgroundColor: Theme.of(context).primaryColor,
// );

// final snackBar = SnackBar(
//   elevation: 6.0,
//   backgroundColor: Configs.current.COLORS_PRIMARY,
//   behavior: SnackBarBehavior.floating,
//   content: Text(
//     "Snack bar test",
//     style: TextStyle(color: Colors.white),
//   ),
// );

// void showToast({
//   String? text,
//    ToastColors? color,
// }) {
//   Fluttertoast.showToast(
//     msg: text,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: setToastColor(color),
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }
//
// enum ToastColors {
//   SUCCESS,
//   ERROR,
//   WARNING,
// }
//
// Color setToastColor(ToastColors color) {
//   Color c;
//
//   switch (color) {
//     case ToastColors.ERROR:
//       c = Colors.red;
//       break;
//     case ToastColors.SUCCESS:
//       c = Colors.green;
//       break;
//     case ToastColors.WARNING:
//       c = Colors.amber;
//       break;
//   }
//
//   return c;
// }

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
      (Route<dynamic> route) => false,
    );

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
