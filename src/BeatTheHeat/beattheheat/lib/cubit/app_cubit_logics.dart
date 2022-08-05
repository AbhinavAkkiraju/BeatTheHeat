import 'package:beattheheat/cubit/app_cubit_states.dart';
import 'package:beattheheat/cubit/app_cubits.dart';
import 'package:beattheheat/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeState) {
        return WelcomePage();
      } 
      if (state is LoadedState) {
        return Center(child: CircularProgressIndicator(),);
      } 
      else {
        return Container();
      }
    }));
  }
}
