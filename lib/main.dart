import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

myweb(cna, ina) async {
  var url = "http://192.168.43.33/cgi-bin/dock.py?x=${cna}&y=${ina}";
  var response = await http.get(url);
  print(response.body);
}

myweb1(sto) async {
  var url = "http://192.168.43.33/cgi-bin/stop.py?x=${sto}";
  var response = await http.get(url);
  print(response.body);
}

myweb2(pul) async {
  var url = "http://192.168.43.33/cgi-bin/pull.py?x=${pul}";
  var response = await http.get(url);
  print(response.body);
}

myweb3(rmo) async {
  var url = "http://192.168.43.33/cgi-bin/remove.py?x=${rmo}";
  var response = await http.get(url);
  print(response.body);
}

myweb4(sta) async {
  var url = "http://192.168.43.33/cgi-bin/start.py?x=${sta}";
  var response = await http.get(url);
  print(response.body);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String imname;
  String coname;
  String stop;
  String pull;
  String remove;
  String start;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Center(child: Text('DOCKER APP')),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Icon(Icons.cloud_circle),
          Icon(Icons.feedback),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                      'https://raw.githubusercontent.com/bansalsajal49/imagetest/master/docker.png'),
                ),
              ),
            ),
            ListTile(
              title: Text('LAUNCH'),
              leading: IconButton(icon: Icon(Icons.launch), onPressed: null),
            ),
            ListTile(
              title: Text('STOP'),
              leading: IconButton(icon: Icon(Icons.stop), onPressed: null),
            ),
            ListTile(
              title: Text('START'),
              leading:
                  IconButton(icon: Icon(Icons.play_arrow), onPressed: null),
            ),
            ListTile(
              title: Text('PULL'),
              leading:
                  IconButton(icon: Icon(Icons.cloud_download), onPressed: null),
            ),
            ListTile(
              title: Text('REMOVE'),
              leading:
                  IconButton(icon: Icon(Icons.remove_circle), onPressed: null),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amberAccent,
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  coname = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter container name",
                  prefixIcon: Icon(Icons.perm_identity),
                ),
              ),
              TextField(
                onChanged: (value) {
                  imname = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter image name",
                  prefixIcon: Icon(Icons.get_app),
                ),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myweb(coname, imname);
                },
                child: Text('Launch'),
              ),
              TextField(
                onChanged: (value) {
                  stop = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter container name",
                  prefixIcon: Icon(Icons.perm_identity),
                ),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myweb1(stop);
                },
                child: Text('Stop'),
              ),
              TextField(
                onChanged: (value) {
                  pull = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter image name",
                  prefixIcon: Icon(Icons.get_app),
                ),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myweb2(pull);
                },
                child: Text('Pull'),
              ),
              TextField(
                onChanged: (value) {
                  remove = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter container name",
                  prefixIcon: Icon(Icons.perm_identity),
                ),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myweb3(remove);
                },
                child: Text('Remove'),
              ),
              TextField(
                onChanged: (value) {
                  start = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter container name",
                  prefixIcon: Icon(Icons.perm_identity),
                ),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myweb4(start);
                },
                child: Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class Mylaunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return*/
