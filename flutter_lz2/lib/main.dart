import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "点赞动画",
      home: Scaffold(
        appBar: AppBar(
          title: Text("点赞动画"),
        ),
        body: LikeButton(
          likeCountAnimationType: LikeCountAnimationType.part,
          countPostion: CountPostion.top,
          likeCount: 0, //数字
          likeBuilder: (bool isLiked) { //图标
            return Icon(
              Icons.local_activity,
              color: isLiked ? Colors.pink[500] : Colors.pink[100],
            );
          },
          circleColor: //圈圈颜色
              CircleColor(start: Colors.pink[500], end: Colors.pink[100]),
          bubblesColor: BubblesColor(  //泡泡颜色
            dotPrimaryColor: Colors.pink[500],
            dotSecondaryColor: Colors.pink[100],
          ),
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.pink[500] : Colors.pink[100];
            Widget result;
            result = Text(
              text,
              style: TextStyle(color: color, fontSize: 20),
            );
            return result;
          },
           countDecoration:(Widget count){
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                count,
                SizedBox(
                    width: 100.0,
                ),
                Text(
                    "loves",
                    style: TextStyle(color: Colors.pink[500]),
                ),
                
                
                
            ],
        );
    }
        ),
      ),
    );
  }
}
