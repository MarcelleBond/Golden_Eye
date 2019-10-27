import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:simple_permissions/simple_permissions.dart';
// import 'package:path_provider/path_provider.dart';

void main() => runApp(Horus());

class Horus extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HORUS',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyHomePage(title: "HORUS"),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
 

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eye of " + widget.title),
      ),
      body: Center(
        child: Column(
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text("Videos"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          )
        ],
      ),
    );
  }
}
