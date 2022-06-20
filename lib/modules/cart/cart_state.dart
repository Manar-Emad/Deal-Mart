part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartBuilderSuccessState extends CartState{}

class CardBuilderLoadingState extends CartState{}

class CardBuilderErrorState extends CartState{
  final String error;

  CardBuilderErrorState(this.error);
}
