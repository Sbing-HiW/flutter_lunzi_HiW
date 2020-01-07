import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "列表左右滑动带出按钮选项",
      home: Scaffold(
        appBar: AppBar(
          title: Text("列表左右滑动带出按钮选项"),
        ),
        body: ListView(children: <Widget>[
          Slidable(
            // dismissal: SlidableDismissal(
            //   child: SlidableDrawerDismissal(),
            //   onWillDismiss: (actionType) {
            //     return showDialog<bool>(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             title: Text('提示？'),
            //             content: Text('确定删除该条记录？'),
            //             actions: <Widget>[
            //               FlatButton(
            //                 child: Text('取消'),
            //                 onPressed: () => Navigator.of(context).pop(false),
            //               ),
            //               FlatButton(
            //                 child: Text('确定'),
            //                 onPressed: () => Navigator.of(context).pop(true),
            //               ),
            //             ],
            //           );
            //         });
            //   },
            //   onDismissed: (actionType) {
            //     print(actionType);
            //   },
            // ),
            //滑出选项的面板 动画
            actionPane: SlidableDrawerActionPane(),
            // SlidableBehindActionPane  //按钮不移动
            // SlidableScrollActionPane  //按钮与列表连接并同时移动
            // SlidableDrawerActionPane  //层叠
            // SlidableStrechActionPane  //同时缩放

            actionExtentRatio: 0.25,
            child: Container(
              color: Colors.pink,
              child: ListTile(
                title: Text("古明地觉"),
              ),
            ),

            actions: <Widget>[
              //左侧按钮列表
              IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
                // onTap: () => _showSnackBar('Archive'),
              ),
              IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                // onTap: () => _showSnackBar('Share'),
              ),
            ],
            secondaryActions: <Widget>[
              //右侧按钮列表
              IconSlideAction(
                caption: 'More',
                color: Colors.black45,
                icon: Icons.more_horiz,
                // onTap: () => _showSnackBar('More'),
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                closeOnTap: false,
                onTap: () {
                  // _showSnackBar('Delete');
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
