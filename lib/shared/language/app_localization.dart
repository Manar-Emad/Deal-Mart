import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// تغيير لغة الابليكيشن علي حسب لغة الجهاز

class AppLocalization{

  final Locale locale;
  AppLocalization({required this.locale , required this.LocalizationStrings});
  static  AppLocalization? of(BuildContext context){
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static  LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();
  Map< String, String > LocalizationStrings;

  Future<bool>load()async{
    String jsonString = await rootBundle.loadString('assets/locals/${locale.languageCode}.json');

    Map<String,dynamic>jsonMap =json.decode(jsonString);
    LocalizationStrings =jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }
 String? translate(String key){
    return LocalizationStrings[key];
}
}
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  @override
  bool isSupported(Locale locale) {

    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async{
    AppLocalization localization =AppLocalization(locale: locale, LocalizationStrings: {});
    await localization.load();
    return localization ;

  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {

    return false;
  }
}