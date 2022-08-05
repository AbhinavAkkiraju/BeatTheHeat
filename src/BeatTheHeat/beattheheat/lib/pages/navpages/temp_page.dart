import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TempPage extends StatelessWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
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
              text: "Safe Sunscreen",
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
                      AppLargeText(size: 22, text: "What's The Temperature \nWhere You Live?", color: Colors.black.withOpacity(0.8)),
                    ],
                  ),
                  Container(
                    height: 99,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: 
                          const [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Latitude',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                                ),
                                border: OutlineInputBorder(),
                              )
                            )
                          ]
                      )
                    )
                  ),
                  Container(
                    height: 99,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: 
                          const [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Longitude',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                                ),
                                border: OutlineInputBorder(),
                              )
                            )
                          ]
                      )
                    )
                  ),
              ]
            )
          )),
          Positioned(
            top: 70,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      AppLargeText(size: 22, text: "Temparature: 0 (Fahrenheit)\nTemperature: 0 (Celsius)\nHumidity: 0\nRecommended SPF: 30-70 SPF", color: Colors.black.withOpacity(0.8)),
                    ],
                  ),
              ]),
          ),
          ),
          Positioned(
            child: Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            width: 350,
            height: 150,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: DecorationImage(
            image: AssetImage("img/sun.jpeg"),
            fit: BoxFit.cover,
         )),
      )
            )
          ])
          );
  }
}