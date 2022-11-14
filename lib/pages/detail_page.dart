import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain/cubit/app_cubit_states.dart';
import 'package:mountain/cubit/app_cubits.dart';
import 'package:mountain/widgets/app_buttons.dart';
import 'package:mountain/widgets/app_text.dart';
import 'package:mountain/widgets/colors.dart';
import 'package:mountain/widgets/large_app_text.dart';
import 'package:mountain/widgets/responsive_botton.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state){
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left : 0,
                  right: 0,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                            fit: BoxFit.cover
                        )
                    ),
                  )),
              Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        BlocProvider.of<AppCubits>(context).goHome();
                      }, icon: Icon(Icons.arrow_back),color: Colors.white,),
                    ],
                  )),
              Positioned(
                  top: 250,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),topLeft: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LargeAppText(text: detail.place.name!,color: Colors.black54,),
                              LargeAppText(text: "\$"+detail.place.price.toString(),color: AppColors.mainColor,)
                            ],),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_on,color: AppColors.textColor1,),
                              AppText(text: detail.place.location!,color: AppColors.textColor1,)
                            ],
                          ),),
                        SizedBox(height: 10,),
                        Row(children: [
                          Wrap(children: List.generate(5, (index){
                            return Icon(Icons.star,color: index<detail.place.stars!?AppColors.starColor:AppColors.textColor2,);
                          }
                          ),),
                          SizedBox(width: 10,),
                          AppText(text: "(5.0)",color: AppColors.textColor1,)
                        ],),
                        SizedBox(height: 10,),
                        LargeAppText(text: "People",size: 20,color: Colors.black.withOpacity(0.8)),
                        SizedBox(height: 5,),
                        AppText(text: "Number of people in your group",color: AppColors.mainColor,),
                        SizedBox(height: 10,),
                        Wrap(children:
                        List.generate(5, (index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: selectedIndex==index?Colors.white:Colors.black,
                                backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                borderColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                text: (index+1).toString(),),
                            ),
                          );
                        }),),
                        SizedBox(height: 15,),
                        LargeAppText(text: "Description",color: Colors.black.withOpacity(0.8),),
                        SizedBox(height: 5,),
                        AppText(text: detail.place.description!,color: AppColors.mainColor,),
                        SizedBox(height: 10,)
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 5,
                  right: 20,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButtons(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,),
                      ResponsiveBotton(isResponsive: true,
                        text: "Book Trip Now",)
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
