import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
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
              text: "Healthy Hydration",
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 23, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Quantity"),
                    Tab(text: "Additives"),
                    Tab(text: "Fun"),
                  ],
                )),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/waterbottle.jpg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/quantity.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      }
                    },
                  ),
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/fruitwater.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      } else if (index == 1) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/limewatter.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/mio.png"),
                                fit: BoxFit.cover,
                              )),
                        );
                      }
                    },
                  ),
                  ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/swimming.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      } else if (index == 1) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/surfing.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      } else if (index == 2) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/waterskiing.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      }
                      else {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 17),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/boating.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        );
                      }
                    },
                  ),
                ],
              )),
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 20),
            width: 350,
            height: 150,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: DecorationImage(
            image: AssetImage("img/water.jpeg"),
            fit: BoxFit.cover,
         )),
      )],
      ),
    );
  }
}
