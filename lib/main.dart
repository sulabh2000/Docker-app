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

myrun() async {
  var url = "http://192.168.43.33/cgi-bin/run.py";
  var response = await http.get(url);
  print(response.body);
}

myconall() async {
  var url = "http://192.168.43.33/cgi-bin/conall.py";
  var response = await http.get(url);
  print(response.body);
}

myima() async {
  var url = "http://192.168.43.33/cgi-bin/images.py";
  var response = await http.get(url);
  print(response.body);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('DOCKER APP')),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Icon(Icons.cloud_circle),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset('menu.jpeg'),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myrun()));
                },
                title: Text(' VIEW RUNNING CONTAINERS'),
                leading: Icon(Icons.directions_run),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myconall()));
                },
                title: Text(' VIEW ALL CONTAINERS'),
                leading: Icon(Icons.all_inclusive),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myimages()));
                },
                title: Text('VIEW IMAGES'),
                leading: Icon(Icons.all_out),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mylaunch()));
                },
                title: Text('LAUNCH'),
                leading: Icon(Icons.launch),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mystop()));
                },
                title: Text('STOP'),
                leading: Icon(Icons.stop),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mystart()));
                },
                title: Text('START'),
                leading: Icon(Icons.play_arrow),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mypull()));
                },
                title: Text('PULL'),
                leading: Icon(Icons.cloud_download),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myremove()));
                },
                title: Text('REMOVE'),
                leading: Icon(Icons.remove_circle),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('dockerhome.png'),
        ),
      ),
    );
  }
}

class Mylaunch extends StatelessWidget {
  String imname;
  String coname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('LAUNCH'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 400,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Mystop extends StatelessWidget {
  String stop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('STOP'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Mystart extends StatelessWidget {
  String start;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('START'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
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

class Mypull extends StatelessWidget {
  String pull;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('PULL'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Myremove extends StatelessWidget {
  String remove;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('REMOVE'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Myrun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('RUNNING CONTAINERS'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myrun();
                },
                child: Text('View Running Containers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Myconall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('ALL CONTAINERS'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myconall();
                },
                child: Text('View All Containers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Myimages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.accessibility_new),
        title: Text('ALL IMAGES'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('docker.png'),
              ),
              FlatButton(
                onPressed: () {
                  // print('hi');
                  myima();
                },
                child: Text('View All Images'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
