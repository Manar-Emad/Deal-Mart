

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/app_cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (BuildContext context, Object? state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
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
