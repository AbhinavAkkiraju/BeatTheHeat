import 'package:beattheheat/cubit/app_cubit_logics.dart';
import 'package:beattheheat/cubit/app_cubits.dart';
import 'package:beattheheat/pages/navpages/detail_page1.dart';
import 'package:beattheheat/pages/navpages/detail_page2.dart';
import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/pages/welcome_page.dart';
import 'package:beattheheat/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Beat the Heat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<AppCubits>(
          create: (context)=>AppCubits(
          data: DataServices(),
        ),
          child: DetailPage2(),
        )
      );
  }
}
