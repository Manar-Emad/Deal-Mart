import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:deal_mart/models/home_model.dart';
import 'package:deal_mart/modules/favourites/favourities_screen.dart';
import 'package:deal_mart/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cart_model.dart';
import '../../modules/cart/cart_screen.dart';
import '../../modules/home/home_layout.dart';
import '../../modules/settings/settings_screen.dart';
import '../../modules/to_win/winners_screen.dart';
import '../components/components.dart';
import '../components/constants.dart';
import '../network/end_points.dart';
import '../network/remote/dio_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool engLang = true;
  void changeLanguage({required bool lange}) {
    engLang = lange;
    emit(ChangeAppLanguageState());
  }

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const FavouritiesScreen(),
    TopWinnersScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];

  changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).
    then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.toString());
      printFullText(homeModel.toString());
      emit(SuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorHomeDataState());
    });
  }

  // bool isBottomSheetShown = false;
  // void changeBottomSheetState({required bool isShow}) {
  //   isBottomSheetShown = isShow;
  //   emit(AppChangeBottomSheetState());
  // }
}
