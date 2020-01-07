import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

List name = ["点击第一个按钮", "点击第二个按钮", "点击第三个按钮"];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "可展开浮动按钮+Toast弹窗",
      home: Scaffold(
        appBar: AppBar(
          title: Text("可展开浮动按钮+Toast弹窗"),
        ),
        body: Container(),
        floatingActionButton: SpeedDial(
          marginRight: 25, //右边距
          marginBottom: 50, //下边距
          animatedIcon: AnimatedIcons.menu_close, //带动画的按钮
          animatedIconTheme: IconThemeData(size: 22.0),
          // visible: isShow,//是否显示按钮
          closeManually: false, //是否在点击子按钮后关闭展开项
          curve: Curves.easeInToLinear, //展开动画曲线
          overlayColor: Colors.pink, //遮罩层颜色
          overlayOpacity: 0.4, //遮罩层透明度
          onOpen: () => print('OPENING DIAL'), //展开回调
          onClose: () => print('DIAL CLOSED'), //关闭回调
          tooltip: 'Speed Dial', //长按提示文字
          heroTag: 'speed-dial-hero-tag', //hero标记
          backgroundColor: Colors.pink[400], //按钮背景色
          foregroundColor: Colors.pink[100], //按钮前景色/文字色
          elevation: 8.0, //阴影
          shape: CircleBorder(), //shape修饰
          children: [
            SpeedDialChild(
              child: Icon(Icons.cloud_download),
              backgroundColor: Colors.red,
              onTap: () => FlutterToast(1),
            ),
            SpeedDialChild(
              child: Icon(Icons.cloud_download),
              backgroundColor: Colors.yellow,
              onTap: () => FlutterToast(2),
            ),
            SpeedDialChild(
              child: Icon(Icons.cloud_download),
              backgroundColor: Colors.green,
              onTap: () => FlutterToast(3),
            ),
          ],
        ),
      ),
    );
  }
}

FlutterToast(value) {
  Fluttertoast.showToast(
      msg: name[value - 1], //	展示的文字内容
      toastLength:Toast.LENGTH_SHORT, // 时间长短Toast.LENGTH_SHORT、Toast.LENGTH_LONG
      gravity: ToastGravity.CENTER, // 位置（上中下）ToastGravity.TOP、ToastGravity.CENTER、 ToastGravity.BOTTOM
      timeInSecForIos: 1, // 展示时长，仅iOS有效
      backgroundColor: Colors.grey, // 	背景颜色
      textColor: Colors.white, // 文字颜色
      fontSize: 16.0); //	文字大小
}
