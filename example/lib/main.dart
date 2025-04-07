import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ddlog/ddlog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DLog.enableColor = false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    _counter++;
    setState(() {});
    onTest();
  }

  void onTest() {
    try {
      var map = {};
      jsonDecode(map["a"]);
    } catch (e) {
      debugPrint("$this $e"); //flutter: _MyHomePageState#93d3a type 'Null' is not a subtype of type 'String'
      DLog.d(
          "$e"); //[log] [2025-04-07 09:51:55.124314][DEBUG][ios][_MyHomePageState.onTest Line:89]: type 'Null' is not a subtype of type 'String'
      DLog.i(
          "$e"); //[log] [2025-04-07 09:51:55.125002][INFO][ios][_MyHomePageState.onTest Line:90]: type 'Null' is not a subtype of type 'String'
      DLog.w(
          "$e"); //[log] [2025-04-07 09:51:55.125578][WARN][ios][_MyHomePageState.onTest Line:91]: type 'Null' is not a subtype of type 'String'
      DLog.e(
          "$e"); //[log] [2025-04-07 09:51:55.126098][ERROR][ios][_MyHomePageState.onTest Line:92]: type 'Null' is not a subtype of type 'String'
    }
  }
}
