import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String imname;
  String coname;
  String stop;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('DOCKER APP'),
          leading: Icon(Icons.touch_app),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
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
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
