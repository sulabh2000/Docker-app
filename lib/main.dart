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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Image.asset('docker.png'),
                ),
              ),
            ),
            ListTile(
              title: Text('LAUNCH'),
              leading: IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mylaunch()));
                  }),
            ),
            ListTile(
              title: Text('STOP'),
              leading: IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mystop()));
                  }),
            ),
            ListTile(
              title: Text('START'),
              leading: IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mystart()));
                  }),
            ),
            ListTile(
              title: Text('PULL'),
              leading: IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mypull()));
                  }),
            ),
            ListTile(
              title: Text('REMOVE'),
              leading: IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Myremove()));
                  }),
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
            children: <Widget>[],
          ),
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.ac_unit),
        title: Text('LAUNCH'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.ac_unit),
        title: Text('STOP'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.ac_unit),
        title: Text('START'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.ac_unit),
        title: Text('PULL'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.ac_unit),
        title: Text('REMOVE'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Column(
            children: <Widget>[
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
