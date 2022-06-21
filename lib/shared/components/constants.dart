
import 'package:flutter/material.dart';

import '../../modules/login/login_screen.dart';
import '../network/local/cache_heloer.dart';
import '../styles/styles.dart';
import 'components.dart';

/// SIGN OUT BUTTON
void signOut(context){
  TextButton(child: Text('Sign out',style: red14bold(),),
      onPressed: (){
        CacheHelper.removeData(key: 'token').then((value) {
          if(value!){
            navigateAndFinish(context, LoginScreen());
          }
        });
      });
}
/// print full text
void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token ='' ;

