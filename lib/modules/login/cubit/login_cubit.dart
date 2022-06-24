import 'package:deal_mart/models/login_model.dart';
import 'package:deal_mart/models/register_model.dart';
import 'package:deal_mart/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/end_points.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

 late LoginModel loginModel;
void userLogin({required String email,required String password}){
  emit(LoginLoadingState());
  DioHelper.postData(
    url: LOGIN,
    data: {
      'email':email,
      'password':password,
    },
  ).then((value) { print(value.data);
    loginModel = LoginModel.fromJson(value.data);
    print(loginModel.status);
    print(loginModel.message);
    print(loginModel.data!.token);
    emit(LoginSuccessState(loginModel));
  }

  ).catchError((error){
    print(error.toString());
    emit(LoginErrorState(error.toString()));
  });

} 

IconData suffix=Icons.visibility_outlined;
bool isPassword=true;
void changePasswordVisibility(){
  isPassword = !isPassword;
  suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(ChangePasswordVisibilityState());
}
/// Register
   // void createUser({
   //   required String name,
   //   required String email,
   //   required String password,
   //   required String token,
   //
   // }) {
   //   RegisterModel model = RegisterModel(
   //     name: name,
   //     password: password,
   //     email: email,
   //     token: token,
   //     qrcode: qrcode =
   //     'https://thecityfix.com/wp-content/uploads/2019/10/Open-Streets-Dog_IT.jpg',
   //     isEmailVerified: false,
   //     latitude: 31.040720,
   //     longitude: 31.382469,
   //   );
   //
   //   db.child('Users').child(uId).set(model.toMap()).then((value) {
   //     emit(AppCreateUserSuccessState(uId));
   //   }).catchError((error) {
   //     emit(AppCreateUserErrorState(error));
   //   });
   // }


}
