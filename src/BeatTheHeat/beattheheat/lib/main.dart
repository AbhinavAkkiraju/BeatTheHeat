import 'dart:convert';

import 'package:beattheheat/cubit/app_cubit_logics.dart';
import 'package:beattheheat/cubit/app_cubits.dart';
import 'package:beattheheat/pages/navpages/detail_page1.dart';
import 'package:beattheheat/pages/navpages/detail_page2.dart';
import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/pages/welcome_page.dart';
import 'package:beattheheat/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Beat the Heat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            data: DataServices(),
          ),
          child: WelcomePage(),
        ));
  }

  final url = "https://beattheheat.azurewebsites.net/swagger/index.html";

  void postData() async {
    try {
      final response = await post(Uri.parse(url), body: {
        "address": "Address",
      });

      print(response.body);
    } catch (er) {}
  }

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
    } catch (err) {}
  }
}
