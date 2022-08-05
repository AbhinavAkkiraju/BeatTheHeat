import 'package:beattheheat/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width=120, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
    child: Container(
      width: isResponsive==true?double.maxFinite:width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange
      ),
      child: Row(
        mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          isResponsive==true?Container(margin:const EdgeInsets.only(left: 20), child: AppText(text: "See More Information", color: Colors.white,)):Container(),
          Image.asset("img/arrow.png", height: 30, width: 70, color: Colors.black,),
        ],
      ),
    ));
  }
}
