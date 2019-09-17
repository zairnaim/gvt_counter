import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple),
      home: MyHomePage(title: 'GVT TIME BOIS'),
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;
  var _fourtwo = ["One", "Two", "Three", "Four", "One", "Two"];
  var _threetwo = ["One", "Two", "Three", "One", "Two"];
  bool _counting;
  FlutterTts flutterTts = new FlutterTts();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _speak(List countingstringlist) async {
    _counter = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      print(DateTime.now());
      _sayNumber(countingstringlist);
    });
    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  _sayNumber(List countingstringlist) async {
    var result = await flutterTts.speak(countingstringlist[_counter % countingstringlist.length]);
    _counter++;
    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Image(
              image: AssetImage('images/w1.jpg'),
              fit: BoxFit.contain,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              // color: Color.fromARGB(120, 255, 255, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      right: 12,
                      left: 16,
                    ),
                    child: Card(
                      color: Color.fromARGB(190, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'You are on set #:',
                            ),
                            Text('$_counter',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 16)
                                //style: Theme.of(context).textTheme.display1,
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      onPressed: (){_speak(_fourtwo);},
                      child: Text(
                        "4-0-2-0",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 64,
                      right: 16,
                      left: 16,
                    ),
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      onPressed: (){_speak(_threetwo);},
                      child: Text(
                        "3-0-2-0",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _speak, //_incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
