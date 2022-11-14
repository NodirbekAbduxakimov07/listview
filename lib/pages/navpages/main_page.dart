import 'package:flutter/material.dart';
import 'package:mountain/pages/navpages/bar_item_page.dart';
import 'package:mountain/pages/navpages/home_page.dart';
import 'package:mountain/pages/navpages/my_page.dart';
import 'package:mountain/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index){
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
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
