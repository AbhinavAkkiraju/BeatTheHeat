import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/widgets/app_buttons.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/app_text.dart';

class DetailPage2 extends StatefulWidget {
  const DetailPage2({Key? key}) : super(key: key);

  @override
  State<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
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
                    image: AssetImage("img/fruitwater.jpeg"),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                  }, icon: Icon(Icons.menu),
                    color: Colors.black,
                  ),
                ]
            )),
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
                  )
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppLargeText(text: "Fruit Water Recipe", color: Colors.black.withOpacity(0.8))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.orange),
                        SizedBox(width: 5,),
                        AppText(text: "simpleveganblog.com", color: Colors.orange)                        
                      ]
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        AppText(text: "Ingredients:\n     - 1 orange, sliced\n     - 6 strawberries, sliced\n     - 10 mint leaves\n     - 4 cups water (1 liter)\n\nInstructions:\n     - Place the sliced fruits and the mint \n        leaves in a glass jar\n     - Pour the water and refrigerate for at \n        least 1 or 2 hours or overnight. The \n        longer it sits, the more flavorful the water\n        will be."),
                      ]
                    ),

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
                  AppButtons(size: 60, color: Colors.orange, backgroundColor: Colors.white, borderColor: Colors.black, isIcon: true, icon: Icons.favorite_border),
                  SizedBox(width: 20),
                  ResponsiveButton(
                    isResponsive: true,
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}