import 'dart:convert';

import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/weatherapi.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class _TempPageState extends State<TempPage> {
  WeatherForecast? weatherForecast;
  String? address;
  void postData() async {
    try {
      Map<String, String> queryParams = {
        'address': address ?? "",
      };
      final qP = Uri.https("beattheheat.azurewebsites.net",
          "/api/v1/weather-forecast/current-address", queryParams);
      final response = await get(qP);
      print(response.statusCode);
      print(response.body);
      setState(() {
        weatherForecast = WeatherForecast.fromJson(jsonDecode(response.body));
      });
    } catch (er) {
      print(er);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(top: 70, left: 20),
        child: Row(
          children: [Icon(Icons.menu, size: 30, color: Colors.black54)],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: AppLargeText(
          text: "Safe With Sunscreen",
        ),
      ),
      SizedBox(height: 30),
      Positioned(
          top: 100,
          child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(children: [
                Row(
                  children: [
                    AppLargeText(
                        size: 22,
                        text: "What's The Temperature \nWhere You Live?",
                        color: Colors.black.withOpacity(0.8)),
                  ],
                ),
                Container(
                    height: 99,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 25, right: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      address = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Address',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    disabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(),
                                  ))
                            ]))),
                GestureDetector(
                  onTap: () {
                    postData();
                  },
                  child: Container(
                      width: 200,
                      child: ResponsiveButton(
                        width: 200,
                      )),
                ),
              ]))),
      SizedBox(height: 20),
      Positioned(
        top: 30,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(children: [
            Row(
              children: [
                AppLargeText(
                    size: 16,
                    text: "Temparature: " +
                        (weatherForecast?.temperatureF?.toString() ?? "") +
                        " (Fahrenheit)\nTemperature: " +
                        (weatherForecast?.temperatureC?.toString() ?? "") +
                        " (Celsius)\nHumidity: " +
                        (weatherForecast?.humidity?.toString() ?? "") +
                        "\nRecommended SPF: 30-70 SPF",
                    color: Colors.black.withOpacity(0.8)),
              ],
            ),
          ]),
        ),
      ),
      Positioned(
          child: Container(
        margin: const EdgeInsets.only(left: 20, top: 15),
        width: 350,
        height: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("img/heatindex.jpeg"),
              fit: BoxFit.cover,
            )),
      ))
    ]));
  }
}

class TempPage extends StatefulWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  State<TempPage> createState() => _TempPageState();
}
