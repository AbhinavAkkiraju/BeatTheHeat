import 'dart:convert';

import 'package:beattheheat/coolingcenterapi.dart';
import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/app_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class _CoolingPageState extends State<CoolingPage> {
  CoolingCenter? location;
  String? address;
  void postData() async {
    try {
      Map<String, String> queryParams = {
        'address': address ?? "",
      };
      final qP = Uri.https("beattheheat.azurewebsites.net",
          "/api/v1/cooling-centers/near-address", queryParams);
      final response = await get(qP);
      print(response.statusCode);
      print(response.body);
      Iterable l = json.decode(response.body);
      var locations = List<CoolingCenter>.from(
          l.map((model) => CoolingCenter.fromJson(model)));
      setState(() {
        location = locations[0];
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
          text: "Cooling Centers",
        ),
      ),
      SizedBox(height: 30),
      Positioned(
        top: 100,
        child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    AppLargeText(
                        size: 22,
                        text: "Want To Find Your Nearest \nCooling Center?",
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
                                  onChanged: (text) {
                                    setState(() {
                                      address = text;
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
                SizedBox(height: 30),
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
                SizedBox(height: 80),
                Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Closest Cooling Center To You:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        location?.name ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.orange),
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        location?.address ?? "",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                )
              ],
            )),
      )
    ]));
  }
}

class CoolingPage extends StatefulWidget {
  CoolingPage({Key? key}) : super(key: key);

  @override
  State<CoolingPage> createState() => _CoolingPageState();
}
