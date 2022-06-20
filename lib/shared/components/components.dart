import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icons.dart';
import '../../modules/login/login_screen.dart';
import '../network/local/cache_heloer.dart';
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

/// snackBar Widget
snackBar({
  context,
  String? message,
  required SnackBarStates state,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message!),
      duration: const Duration(seconds: 2),
      backgroundColor: chooseSnackBarColor(state),
      padding: const EdgeInsets.all(10),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ) ,
    ),
  );
}
///enum for snackBar
enum SnackBarStates{SUCCESS , ERROR ,WARNING}

Color? chooseSnackBarColor(SnackBarStates state){
  Color color;
  switch(state){
    case SnackBarStates.SUCCESS :
      color= Colors.green;
      break ;
    case SnackBarStates.ERROR :
      color= Colors.red;
      break ;
    case SnackBarStates.WARNING :
      color= Colors.amber;
      break ;

  }
  return color;
}

///SHOW TOAST MESSAGE
// void showToast({required String text,required ToastStates state}){
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0
//   );
// }
// ///enum for toast
// enum ToastStates{SUCCESS , ERROR ,WARNING}
//
// Color? chooseToastColor(ToastStates state){
//   Color color;
//   switch(state){
//     case ToastStates.SUCCESS :
//       color= Colors.green;
//       break ;
//     case ToastStates.ERROR :
//       color= Colors.red;
//       break ;
//     case ToastStates.WARNING :
//       color= Colors.amber;
//       break ;
//
//   }
//   return color;
// }


/// black arrow icon
Widget arrow_forward = const Icon(
  Icons.arrow_forward_ios,
  color: secondColor,
  size: 18,
);

/// ALERT DIALOG
enum DialogAction { cancel, delete }

class AlertDialogs {
  static Future<DialogAction?> cancelDeleteDialog(
      BuildContext context,
      String body,
      String cancelTxt,
      String deleteTxt,
      ) async {
    var action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //title: Text('titleeee'),
            content: Text(body),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogAction.cancel);
                },
                child: Text(
                  cancelTxt,
                  style: grey12bold(),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(DialogAction.delete);
                },
                child: Text(
                  deleteTxt,
                  style: red12bold(),
                ),
              )
            ],
          );
        });
    return (action != null) ? action = DialogAction.cancel : null;
  }
}

/// AppBar
AppBar buildAppBar({String? title}) {
  return AppBar(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    title: Text(title!),
    centerTitle: true,
  );
}

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

Widget defContainer(context, widget,{Color? color})=> Padding(
  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  child: Container(
    height:getHeight(context)/6,
    width: getWidth(context),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: defTextColor,
          // spreadRadius: 5,
          // blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      child: widget,
    ),
  ),
);


/// Separator divider
Widget defaultSeparator(Color? color) => Container(
      width: double.infinity,
      height: 1.0,
      color: color,
    );
///Divider
Widget myDivider(context) {
  return Divider(
    color: secondColor.withOpacity(0.15),
    thickness: 1,
  );
}

/// CircularProgressIndicator
Widget buildCircularProgressIndicator() => const Center(
  child: CircularProgressIndicator(),
);

// void Logout(BuildContext context) {
//   FirebaseAuth.instance.signOut();
//   CacheHelper.removeData(key: 'uid');
//   uid = null;
//   navigateAndFinish(context, LoginScreen());
//
//   // CacheHelper.removeData(key: 'qr_read');
// }

///Button
Widget defaultButton(BuildContext context, {
  required Function()? function,
  required String text,
  Widget? child,
  Color? color,
   required Color borderColor,
  Color? txtColor,
}) =>
    Container(
      height: getHeight(context)/14,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
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

///Container Details in Details Screen
Widget containerBorder(context,Widget widget)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
  child:   Container(
    height: getHeight(context)/30,
    width: getWidth(context)/8,
    decoration: BoxDecoration(
      border: Border.all(color:Colors.grey,width: .5 ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: widget,
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
void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        // return false,
        (route) {
      return false;
    });

/// TEXT FORM FEILD
Widget formFeild({
  IconData? suffix,
  Color? suffixColor,
  IconData? prefix,
  required String txt,
  required bool isClikable,
  dynamic validate,
  Function(String)? onSubmit,
  Function()? onTap,
  TextEditingController? controller,
  TextInputType? type,
  VoidCallback? suffixPressed,
  InputBorder? focusedBorder,
  InputBorder? disabledBorder,
  bool? isPassword=false,
}) =>
    MaterialButton(
      onPressed: onTap,
      child: TextFormField(
        obscureText: isPassword!,
        autofocus: true,
        style: black14bold(),
        enabled: isClikable,
        controller: controller,
        validator: validate,onFieldSubmitted: onSubmit,
        keyboardType: type,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: formContainer,
            ),
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: formContainer,
              width: 2.0,
            ),
          ),
          prefixIconColor: primaryColor,
          suffixIconColor: secondColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: txt,
          hintStyle: TextStyle(color: textGray,fontSize: 14,fontWeight: FontWeight.normal),
          labelStyle: black14bold(),
          filled: true,
          fillColor: formContainer,
          suffixIcon: suffix!= null ?IconButton(icon: Icon(suffix,color: suffixColor,),onPressed: suffixPressed,): null,
          prefixIcon: Icon(
            prefix,
            color: primaryColor,
          ),
        ),
      ),
    );


/// Cart Button with text
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

///Bottom Navigation Bar
BottomNavigationBarItem buildBottomNavigationBarItem({required String icon,required String activeIcon,required String text,}) {
  return BottomNavigationBarItem(
    icon: Image.asset('assets/icons/$icon.png'),
    activeIcon: Image.asset('assets/icons/$activeIcon.png'),
    label: text,
  );
}

