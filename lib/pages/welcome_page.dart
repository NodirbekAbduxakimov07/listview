import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain/cubit/app_cubits.dart';
import 'package:mountain/widgets/app_text.dart';
import 'package:mountain/widgets/colors.dart';
import 'package:mountain/widgets/large_app_text.dart';
import 'package:mountain/widgets/responsive_botton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "mountain04.jpg",
    "moun2.jpg",
    "mountain03.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
          itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/"+images[index]),
                  fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: EdgeInsets.only(top: 150,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeAppText(text: "Tips"),
                      AppText(text: "Mountain",size: 30),
                      SizedBox(height: 15,),
                      Container(
                        width: 240,
                        child: AppText(text: "Mountain hikes give you an incredible "
                            "sence of freedom along with "
                            "endurance tests",size: 14,)
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(width: 100,
                            child: ResponsiveBotton(widht: 100,)),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexPage){
                      return Container(
                        width: 8,
                        height: index == indexPage ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: index == indexPage ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
      }));
  }
}
