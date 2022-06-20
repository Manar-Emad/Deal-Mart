import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/app_cubit/app_cubit.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: ( context,state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Scaffold(
              body:  AppCubit.get(context).bottomScreens
              [ AppCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  AppCubit.get(context).changeBottom(index);
                },
                currentIndex:  AppCubit.get(context).currentIndex,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favourities'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.discount_outlined), label: 'Winners'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outlined), label: 'Profile'),
                ],
              ),
            ),
          );
        },
      );
  }
}
