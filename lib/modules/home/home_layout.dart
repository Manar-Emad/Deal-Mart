

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/app_cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: ( context,state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Scaffold(
            // appBar: AppBar(
            //   // actions: [
            //   //   IconButton(
            //   //       icon: Icon(Icons.search),
            //   //       onPressed: (){navigateTo(context, SearchScreen());}
            //   //   ),
            //   // ],
            //   title: Text('Salla'),
            // ),
            body:  AppCubit.get(context).bottomScreens[ AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
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
