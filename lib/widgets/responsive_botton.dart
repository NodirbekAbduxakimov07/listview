import 'package:flutter/material.dart';
import 'package:mountain/widgets/app_text.dart';

class ResponsiveBotton extends StatelessWidget {
  bool? isResponsive;
  double? widht;
  String? text;
  ResponsiveBotton({Key? key,this.isResponsive = false,this.widht, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widht,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFF5d69b3)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isResponsive == true ? Container(
            margin: const EdgeInsets.only(left: 10),
              child: AppText(text: text!,color: Colors.white,)):Container(),
          // Icon(Icons.arrow_right_alt_outlined,color: Colors.white,),
          Icon(Icons.arrow_right,color: Colors.white,),
          Icon(Icons.arrow_right,color: Colors.white,),
          Icon(Icons.arrow_right,color: Colors.white,)
        ],
      ),
    );
  }
}
