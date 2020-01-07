import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  int currentIndex = 0;
  List colors=[Colors.pink[100],Colors.pink[200],Colors.pink[300]];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          currentIndex = tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "底部导航栏动画",
      home: Scaffold(
          appBar: AppBar(
            title: Text("底部导航栏动画"),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            
            backgroundColor: colors[currentIndex],
            items: <Widget>[
              
              Icon(Icons.add, size: 40,),
              Icon(Icons.list, size: 40),
              Icon(Icons.compare_arrows, size: 40),

            ],
            onTap: (index) {
              //Handle button tap
              setState(() {
                currentIndex = index;
              });
              tabController.animateTo(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.slowMiddle);
            },
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              Container(
                color: colors[currentIndex],
              ),
              Container(
                color: colors[currentIndex],
              ),
              Container(
                color: colors[currentIndex],
              ),
            ],
          )),
    );
  }
}
