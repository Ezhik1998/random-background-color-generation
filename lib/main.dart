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
  Color _backgroundColor, _textColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = Colors.white;
    _textColor = Colors.black;
  }

  // Generate random background color
  void _generateBackgroundColor() {
    _backgroundColor = _getRandom();
    _textColor = _getRandom();
    // _backgroundColor = Color.fromRGBO(
    //     random.nextInt(256),
    //     random.nextInt(256),
    //     random.nextInt(256),
    //     random.nextDouble());
    setState(() {});
  }

  Color _getRandom() {
    Random random = Random();
    // return Color.fromARGB(random.nextInt(256), random.nextInt(256),
    //     random.nextInt(256), random.nextInt(256));

    // fix opacity error, now generate value in [0; 1]
    return Color.fromRGBO(random.nextInt(256), random.nextInt(256),
        random.nextInt(256), random.nextInt(pow(10, 7) + 1) / pow(10, 7));
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
                  color: _textColor),
            ),
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInCubic,
        ),
      ),
    );
  }
}
