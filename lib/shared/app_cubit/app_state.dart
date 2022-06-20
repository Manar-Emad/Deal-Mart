part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeAppLanguageState extends AppState{}

class AppChangeBottomNavBarState extends AppState{}

class AppChangeBottomSheetState extends AppState{}

class LoadingHomeDataState extends AppState{}

class SuccessHomeDataState extends AppState{}

class ErrorHomeDataState extends AppState{}


