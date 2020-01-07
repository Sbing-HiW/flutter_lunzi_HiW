import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

List<String> imgs = [
  'https://img.moegirl.org/common/b/ba/28695491.jpg',
  'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=04b5a18760600c33f079d9ce22773632/d788d43f8794a4c212c885b805f41bd5ac6e39bd.jpg',
  'https://img.moegirl.org/common/thumb/2/22/10951654.png/300px-10951654.png',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqNjR6PBI_rjxSIguiHk6OvUFNDnDz-NsGc4rSB9MRzPXpEo8Eqw&s'
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "轮播",
      home: Scaffold(
        appBar: AppBar(
          title: Text("轮播"),
        ),
        body: Container(
          height: 250,
          child: new Swiper(
            // scrollDirection: Axis.vertical,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                imgs[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: imgs.length,
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.all(10),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white30,
                  activeColor: Colors.pink[200],
                )), //如果不填则不显示指示点
            control: SwiperControl(color: Colors.pink[200]), //如果不填则不显示左右按钮
            

            // //3D卡牌滚动
            // viewportFraction: 0.8,
            // scale: 0.9,

            // //无限卡牌堆叠
            // itemWidth: 300.0,
            // layout: SwiperLayout.STACK,

            //无限卡片堆叠2
            // itemWidth: 300.0,
            // itemHeight: 300.0,
            // layout: SwiperLayout.TINDER,

            //自定义效果
            // layout: SwiperLayout.CUSTOM,
            // customLayoutOption:
            //     new CustomLayoutOption(startIndex: -1, stateCount: 3)
            //         .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
            //   new Offset(-370.0, -40.0),
            //   new Offset(0.0, 0.0),
            //   new Offset(370.0, -40.0)
            // ]),
            // itemWidth: 300.0,
            // itemHeight: 200.0,
          ),
        ),
      ),
    );
  }
}
