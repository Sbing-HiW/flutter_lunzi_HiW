import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List Voidname = [
  ArcClipper(), // 0 倒凹槽
  ArrowClipper(70, 80, Edge.BOTTOM), // 1 下箭头
  DiagonalPathClipperOne(), // 2 斜下矩形
  DiagonalPathClipperTwo(), // 3 斜上矩形
  HexagonalClipper(), // 4 对称六边形1
  HexagonalClipper(reverse: true), // 5 对称六边形2
  MovieTicketClipper(), // 6 波浪凹槽
  MovieTicketBothSidesClipper(), // 7 波浪双凹槽
  MultipleRoundedCurveClipper(), // 8 波浪凹槽小
  MultiplePointedEdgeClipper(), // 9 锯齿凹槽深
  MessageClipper(borderRadius: 16), // 10 中部凸起
  OctagonalClipper(), // 11 对称八边形
  OvalTopBorderClipper(), // 12 上拱形曲线
  OvalBottomBorderClipper(), // 13 下拱形曲线
  OvalRightBorderClipper(), // 14 右拱形曲线
  OvalLeftBorderClipper(), // 15 左拱形曲线
  PointsClipper(), // 16 锯齿凹槽浅
  ParallelogramClipper(), // 17 菱形
  RoundedDiagonalPathClipper(), // 18 山坡弧度
  StarClipper(8), // 19 多角
  SideCutClipper(), // 20 书签
  TriangleClipper(), // 21 倒三角
  WaveClipperOne(), // 22 斜上波浪
  WaveClipperOne(reverse: true), // 23 斜下波浪
  WaveClipperTwo(), // 24 波浪
  WaveClipperTwo(reverse: true), // 26 倒波浪
];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "设置appbar背景拖+各种Widget+设置背景图片",
        home: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.network(
                    "http://www.uzkk.net/wp-content/uploads/2018/12/17083351_p0-800x510.jpg"),
                color: Colors.pink,
              ),
              Scaffold(
                appBar: AppBar(
                  title: Text("设置appbar背景拖+各种Widget+设置背景图片",style: TextStyle(color: Colors.pink),),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                backgroundColor: Colors.transparent,
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://www.uzkk.net/wp-content/uploads/2018/12/17083351_p0-800x510.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      ClipPath(
                        clipper: Voidname[13],
                        child: Container(
                          height: 200,
                          width: 500,
                          color: Colors.pink[100],
                          child: Image.network(
                            "http://www.uzkk.net/wp-content/uploads/2018/12/17083351_p0-800x510.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
