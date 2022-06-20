import 'dart:js';
import 'package:deal_mart/modules/intro/intro_screen.dart';
import 'package:deal_mart/shared/app_cubit/app_cubit.dart';
import 'package:deal_mart/shared/components/constants.dart';
import 'package:deal_mart/shared/network/local/cache_heloer.dart';
import 'package:deal_mart/shared/network/remote/dio_helper.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'shared/language/app_localization.dart';
import 'modules/onboarding/onboarding_screen.dart';
import 'my_bloc_observer.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  ///uid = CacheHelper.getDate(key: 'uid');

  DioHelper.init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
        () {
          AppCubit();},
    blocObserver: MyBlocObserver(),
  );
  bool onBoarding=CacheHelper.getData(key:'OnBoarding');
  token=CacheHelper.getData(key:'token');
  Widget widget;

  if(onBoarding != null){
    if(token != null) {
      widget=AppCubit.get(context).changeBottom(0);
    } else{widget= const IntroScreen();}
  }else{widget=const OnBoardScreen();}


 runApp(  MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

     MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getHomeData(),
        )
      ],
      ///todo show is Error or true???
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //primarySwatch:  Color(0xffF48A36),
              primaryColor: primaryColor,
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: primaryColor,
                unselectedItemColor: textGray,
                elevation: 20,
                type: BottomNavigationBarType.fixed,
                backgroundColor: defTextColor,
              ),
            ),

            /// LOCALIZATION
            supportedLocales: const [
               Locale('en'),
               Locale("ar"),
            ],
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },

            home:startWidget,
          );
        },
      ),
    );
    //     },
    //   ),
    // );
  }
}

