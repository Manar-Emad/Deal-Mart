import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

// List <dynamic>cartItems=[];
// void getCartData() {
//   emit(CardBuilderLoadingState());
//
//   DioHelper.getData(
//    // url: Cart,
//    // token: token,
//   ).then((value) {
//    // cartModel = CartModel.fromJson(value.data);
//
//     // printFullText(homeModel.data?.banners![0].image);
//     // print(homeModel.status);
//
//     /// to add favorites
//     // homeModel.data?.products?.forEach((element) {
//     //   favourities.addAll({element.id: element.inFavorites});
//     // });
//     // print(favourities.toString());
//
//     emit(CardBuilderSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(CardBuilderErrorState(error));
//   });
//}

}
