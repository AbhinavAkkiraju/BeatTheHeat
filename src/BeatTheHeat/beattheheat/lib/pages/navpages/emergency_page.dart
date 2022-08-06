import 'package:beattheheat/pages/navpages/main_page.dart';
import 'package:beattheheat/widgets/app_buttons.dart';
import 'package:beattheheat/widgets/app_large_text.dart';
import 'package:beattheheat/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

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
          text: "Emergency/Contacts",
        ),
      ),
      Container(
          height: 99,
          child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    TextField(
                        decoration: InputDecoration(
                      hintText: 'Add Emergency Contact (XXX-XXX-XXXX)',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(),
                    ))
                  ]))),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        },
        child: Container(
            width: 400,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ResponsiveButton(
              width: 200,
            )),
      ),
      Positioned(
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 100, top: 400)),
              AppButtons(
                  size: 200,
                  color: Colors.orange,
                  backgroundColor: Colors.red,
                  borderColor: Colors.black,
                  isIcon: true,
                  icon: Icons.warning),
            ],
          ))
    ]));
  }
}
