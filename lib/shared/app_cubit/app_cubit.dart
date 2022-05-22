import 'package:bloc/bloc.dart';
import 'package:deal_mart/modules/favourites/favourities_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/cart/cart_screen.dart';
import '../../modules/home/home_layout.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/winners/winners_screen.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> bottomScreens = [

    const HomeScreen(),
    const FavouritiesScreen(),
    const WinnerScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }



}
