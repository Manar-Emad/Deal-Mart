import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:deal_mart/shared/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AppCubit,AppState>(
        listener: (context,state) {},
        builder: (context,state) {
          return ConditionalBuilder(condition:AppCubit.get(context).homeModel != null ,
              builder: (context)=> productsBuilder(),
              fallback: (context)=>const Center(child: CircularProgressIndicator(),));
        },
      ),
    );
  }
}


Widget productsBuilder()=>Column(

);