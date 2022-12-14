import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/pages/navpages/water_page.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/app_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/desert.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomCenter)),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Beat"),
                          AppText(text: "The Heat", size: 30),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            child: AppText(
                                text:
                                    "This app is a submission for the World Youth Coders Hackathon 2022. We really hope you enjoy our project!",
                                color: Colors.grey,
                                size: 14),
                          ),
                          SizedBox(
                            height: 40,
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
                                  width: 120,
                                )),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(
                          4,
                          (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 2.5),
                              width: 8,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Colors.orange
                                    : Colors.orange.withOpacity(0.3),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
