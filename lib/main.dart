import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Generation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = Colors.white;
  }

  // Generate random background color
  void _generateBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(Random().nextInt(256),
          Random().nextInt(256), Random().nextInt(256), Random().nextDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _generateBackgroundColor,
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: _backgroundColor,
          child: Center(
            child: Text(
              "Hey there",
              style: TextStyle(
                  fontSize: 28.0,
                  color: _backgroundColor == Colors.black
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInCubic,
        ),
      ),
    );
  }
}
