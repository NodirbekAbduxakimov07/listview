import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain/cubit/app_cubit_states.dart';
import 'package:mountain/cubit/app_cubits.dart';
import 'package:mountain/widgets/app_text.dart';
import 'package:mountain/widgets/colors.dart';
import 'package:mountain/widgets/large_app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40,left: 20),
                  child: Row(children: [
                    const Icon(Icons.menu,size: 30,color: Colors.black54,),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey
                      ),
                    )
                  ],),
                ),
                SizedBox(height: 10,),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const LargeAppText(text: "Discover")),
                SizedBox(height: 10,),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.only(left: 20,right: 20),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndecator(color: AppColors.mainColor,radius: 4),
                    tabs: [
                      Tab(text: "Places",),
                      Tab(text: "Inspition",),
                      Tab(text: "Emotions",)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 280,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15,top: 10),
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                        // AssetImage("images/moun2.jpg"),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            );
                          }),
                      Text("There"),
                      Text("Bye")
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeAppText(text: "Explore more",size: 22,),
                      AppText(text: "See all",color: AppColors.textColor1,)
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10,right: 10),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppText(text: "Hello",color: AppColors.textColor2,))
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else{
            return Container();
          }
        },
      )
    );
  }
}

class CircleTabIndecator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndecator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }
}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset circleOffset = Offset(configuration.size!.width/2-radius/2,configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
    // TODO: implement paint
  }

}
