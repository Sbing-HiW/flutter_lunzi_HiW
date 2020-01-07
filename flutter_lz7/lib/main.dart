import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "动效抽屉",
      home: Scaffold(
        appBar: AppBar(
          title: Text("动效抽屉"),
        ),
        body: SimpleHiddenDrawer(
          menu: Menu(),
          screenSelectedBuilder: (position, contraller) {
            return Scaffold(
              // appBar: AppBar(
              //   title: Text("hidden_drawer_menu"),
              // ),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Center(
                    //     child: Container(
                    //   color: Colors.pink,
                    //   child: Text("当前页面$position"),
                    // )
                    //     //
                    //     ),
                    IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () {
                        contraller.toggle();
                      },
                    )
                  ]),
            );
          },
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.pink[100],
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Card(
            
            color: Colors.pink[200],
            child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("菜单一"),
              trailing: Icon(Icons.access_alarm),
              onTap: () {
                // SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(0);
              },
            ),
          ),
          Card(
            color: Colors.pink[200],
            child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("菜单二"),
              trailing: Icon(Icons.access_alarm),
              onTap: () {
                // SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
