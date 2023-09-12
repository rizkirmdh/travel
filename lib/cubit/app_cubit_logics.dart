import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/navpages/home_page.dart';
import 'package:travel/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state){
          if (state is WelcomeState){
            return WelcomePage();
          }
          if (state is LoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState){
            return HomePage();
          }
          if (state is DetailState){
            return DetailPage();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
