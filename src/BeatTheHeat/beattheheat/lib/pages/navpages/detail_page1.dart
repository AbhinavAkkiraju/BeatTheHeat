import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/widgets/app_buttons.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/app_text.dart';

class DetailPage1 extends StatefulWidget {
  const DetailPage1({Key? key}) : super(key: key);

  @override
  State<DetailPage1> createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/waterbottle.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
                left: 20,
                top: 50,
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                  ),
                ])),
            Positioned(
              top: 310,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppLargeText(
                            text: "Water Intake",
                            color: Colors.black.withOpacity(0.8))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Icon(Icons.location_on, color: Colors.orange),
                      SizedBox(
                        width: 5,
                      ),
                      AppText(text: "mayoclinic.org", color: Colors.orange)
                    ]),
                    SizedBox(height: 20),
                    Row(children: [
                      AppText(
                          text:
                              "According to the Mayo Clinic: \n\n      Men need about 15.5 cups (3.7 liters) \n      of fluids a day \n\n     Women need about 11.5 cups (2.7 liters) \n      of fluids a day\n\nWater:\n     - Gets rid of wastes through urination, \n        perspiration, and bowel movements\n     - Keeps your temperature normal\n     - Lubricates and cushions joints\n     - Protects sensitive tissues"),
                    ]),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 45,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                        size: 60,
                        color: Colors.orange,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        isIcon: true,
                        icon: Icons.favorite_border),
                    SizedBox(width: 20),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
