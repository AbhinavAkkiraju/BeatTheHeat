import 'package:beattheheat/pages/navpages/cooling_center.dart';
import 'package:beattheheat/pages/navpages/emergency_page.dart';
import 'package:beattheheat/pages/navpages/health_page.dart';
import 'package:beattheheat/pages/navpages/temp_page.dart';
import 'package:beattheheat/pages/navpages/water_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    WaterPage(),
    CoolingPage(),
    TempPage(),
    HealthPage(),
    EmergencyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Water", icon: Icon(Icons.water_drop)),
          BottomNavigationBarItem(label: "Cooling", icon: Icon(Icons.house)),
          BottomNavigationBarItem(label: "Temp", icon: Icon(Icons.thermostat)),
          BottomNavigationBarItem(label: "Health", icon: Icon(Icons.health_and_safety)),
          BottomNavigationBarItem(label: "Emergency", icon: Icon(Icons.emergency)),
        ],
      ),
    );
  }
}
