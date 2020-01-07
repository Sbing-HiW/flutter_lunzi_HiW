import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

/*
flutter_staggered_animations提供三个类：
Animation
AnimationConfiguration
AnimationLimiter
以及四个默认动画类型：

FadeInAnimation 渐隐渐现动画
SlideAnimation 滑动动画
ScaleAnimation 缩放动画
FlipAnimation 翻转动画
(动画可嵌套成组合动画)
*/

List neiRong = [
  {
    "value": "1",
    "name": "古明地觉",
  },
  {
    "value": "2",
    "name": "古明地觉",
  },
  {
    "value": "3",
    "name": "古明地觉",
  },
  {
    "value": "4",
    "name": "古明地觉",
  },
  {
    "value": "5",
    "name": "古明地觉",
  },
  {
    "value": "6",
    "name": "古明地觉",
  },
];

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "列表动画",
        home: Scaffold(
          appBar: AppBar(
            title:
                // Text("列表动画：ListView"),
                Text("列表动画：GeidView"),
          ),
          body: AnimationLimiter(
            child:

                // ListView动画
                // ListView(
                //     children: neiRong.map((value) {
                //   return AnimationListView(value);
                // }).toList()),

                // GridView动画
                GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 2,
                  //纵轴间距
                  mainAxisSpacing: 10.0,
                  //横轴间距
                  crossAxisSpacing: 10.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.0),
                children: neiRong.map((value) {
                return AnimationGeidView(value);
                  }).toList(),
                ),

                //     Column(
                //   children: AnimationConfiguration.toStaggeredList(
                //     duration: Duration(milliseconds: 375),
                //     childAnimationBuilder: (widget) => SlideAnimation(
                //       verticalOffset: 50.0,
                //       child: FadeInAnimation(
                //         child: widget,
                //       ),
                //     ),
                //     children: neiRong.map((value) {
                //       return AnimationColumn(value);
                //     }).toList(),
                //   ),
                // ),

                //     Row(
                //   children: AnimationConfiguration.toStaggeredList(
                //     duration: Duration(milliseconds: 375),
                //     childAnimationBuilder: (widget) => SlideAnimation(
                //       verticalOffset: 50.0,
                //       child: FadeInAnimation(
                //         child: widget,
                //       ),
                //     ),
                //     children: neiRong.map((value) {
                //       return AnimationRow(value);
                //     }).toList(),
                //   ),
                // ),

          ),
        ));
  }
}

//// ListView动画
class AnimationListView extends StatefulWidget {
  final value;
  AnimationListView(this.value);
  @override
  _AnimationListViewState createState() => _AnimationListViewState();
}

class _AnimationListViewState extends State<AnimationListView> {
  @override
  Widget build(BuildContext context) {
    print(widget.value);
    return AnimationConfiguration.staggeredList(
      position: int.parse(widget.value["value"]),
      duration: Duration(milliseconds: 375),

      // // FadeInAnimation 渐隐渐现动画
      // child: FadeInAnimation(
      //     child: Container(
      //   margin: EdgeInsets.all(5),
      //   color: Theme.of(context).primaryColor,
      //   height: 60,
      //   child: Text(widget.value["name"]),
      // )),

      // // SlideAnimation 滑动动画
      // child: SlideAnimation(
      //   verticalOffset: 50.0, //垂直偏移
      //   child: Container(
      //     margin: EdgeInsets.all(5),
      //     color: Theme.of(context).primaryColor,
      //     height: 60,
      //     child: Text(widget.value["name"]),
      //   ),
      // ),

      // // ScaleAnimation 缩放动画
      // child: ScaleAnimation(
      //   child: Container(
      //     margin: EdgeInsets.all(5),
      //     color: Theme.of(context).primaryColor,
      //     height: 60,
      //     child: Text(widget.value["name"]),
      //   ),
      // ),

      // FlipAnimation 翻转动画
      // child: FlipAnimation(
      //   flipAxis: FlipAxis.y, //翻转轴
      //   child: Container(
      //     margin: EdgeInsets.all(5),
      //     color: Theme.of(context).primaryColor,
      //     height: 60,
      //     child: Text(widget.value["name"]),
      //   ),
      // ),

      //四种动画组合
      child: SlideAnimation(
        //滑动
        duration: Duration(seconds: 3), //持续时间
        verticalOffset: 100.0, // 垂直偏差
        child: ScaleAnimation(
          //缩放
          duration: Duration(seconds: 3),
          child: FlipAnimation(
            //反转
            duration: Duration(seconds: 3),
            flipAxis: FlipAxis.y, //反转轴
            child: FadeInAnimation(
              //渐隐渐显
              duration: Duration(seconds: 3),
              child: Container(
                margin: EdgeInsets.all(5),
                color: Theme.of(context).primaryColor,
                height: 60,
                child: Text(widget.value["name"]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//// GeidView动画
class AnimationGeidView extends StatefulWidget {
  final nei;
  AnimationGeidView(this.nei);
  @override
  _AnimationGeidViewState createState() => _AnimationGeidViewState();
}

class _AnimationGeidViewState extends State<AnimationGeidView> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 1, //周期数
      position: int.parse(widget.nei["value"]),
      duration: Duration(milliseconds: 375),
      child: SlideAnimation(
          duration: Duration(seconds: 3),
          verticalOffset: 50,
          child: FadeInAnimation(
            duration: Duration(seconds: 3),
            child: Container(
              color: Colors.pink[100],
              height: 50,
              width: 50,
              child: Text(widget.nei["name"]),
            ),
          )),
    );
  }
}

//// Column动画
class AnimationColumn extends StatefulWidget {
  final name;
  AnimationColumn(this.name);
  @override
  _AnimationColumnState createState() => _AnimationColumnState();
}

class _AnimationColumnState extends State<AnimationColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Theme.of(context).primaryColor,
      height: 60,
      child: Text(widget.name["name"]),
    );
  }
}

//// Row动画  
class AnimationRow extends StatefulWidget {
    final name;
  AnimationRow(this.name);
  @override
  _AnimationRowState createState() => _AnimationRowState();
}

class _AnimationRowState extends State<AnimationRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Theme.of(context).primaryColor,
      height: 60,
      child: Text(widget.name["name"]),
    );
  }
}


