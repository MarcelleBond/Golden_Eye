import 'dart:async';
import "dart:io";
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:simple_permissions/simple_permissions.dart';

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
  Map<PermissionGroup, PermissionStatus> _permissions;
  Directory _list;
  int _listLength = 0;
  List<File> _images = List<File>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startup();
  }
 void addImage(FileSystemEntity entity){
    if (entity.path.contains('.jpg'))
      _images.add(File(entity.path));
  }
  void startup() async
  {
    _permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    _list = new Directory('storage/emulated/0/Download');
    await _list.list(recursive: false, followLinks: false).forEach((FileSystemEntity e){
      addImage(e);
    });
    print(await _list.list(recursive: false, followLinks: false).length);
    
    // _showFilesinDir(_list);
    setState(() {_listLength = _images.length;});
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eye of " + widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: List.generate(_listLength, (index){
          return Center(
            child: Container(
               decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 3.0),
               ),
               padding: const EdgeInsets.all(16.0),
               child:  Image.file(_images[index]), /*  Text(
                 'Video $index',
                 style: Theme.of(context).textTheme.headline,
               ), */
            ),
          );
        }),
      ),
      
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (int item) {
          startup();
        },
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

void _showFilesinDir(dir) {
    dir.list(recursive: false, followLinks: false)
    .listen((FileSystemEntity entity) {
      print(entity.path);
    });
  }
  
}
