import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/app_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoolingPage extends StatelessWidget {
  const CoolingPage({Key? key}) : super(key: key);

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
                      AppLargeText(size: 22, text: "Want To Find Your Nearest \nCooling Center?", color: Colors.black.withOpacity(0.8)),
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
                  GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
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
                                  color: Colors.black),)
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Location', 
                                textAlign: TextAlign.center, 
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: Colors.orange),)
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Address', 
                                textAlign: TextAlign.center, 
                                style: TextStyle(
                                  fontSize: 14, 
                                  color: Colors.black),)
                            ),
                          )
                ],
              )
            ),
          )
        ]
      )
    );
  }
}
