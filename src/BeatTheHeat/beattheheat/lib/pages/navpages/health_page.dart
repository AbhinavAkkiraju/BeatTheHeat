import 'package:beattheheat/pages/navpages/detail_page1.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 1, vsync: this);
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
          text: "Health-Related",
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
                Tab(text: "Health Issues Caused By Heat"),
              ],
            )),
      ),
      Container(
          padding: const EdgeInsets.only(left: 20),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(controller: _tabController, children: [
            ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailPage1()));
                      },
                    ),
                    margin: const EdgeInsets.only(right: 15, top: 17),
                    width: 200,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/heatstroke.jpeg"),
                          fit: BoxFit.cover,
                        )),
                  );
                } else if (index == 1) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 17),
                    width: 200,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/heatexhaustion.jpeg"),
                          fit: BoxFit.cover,
                        )),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 17),
                    width: 200,
                    height: 245,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/heatcramps.jpeg"),
                          fit: BoxFit.cover,
                        )),
                  );
                }
              },
            ),
          ])),
          SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 20),
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
    ]));
  }
}
