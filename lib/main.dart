
import 'package:flutter/material.dart';
import 'package:interval_timer/home.dart';

void main() {
  runApp(
    IntervalTimer(),
  );
}

class IntervalTimer extends StatelessWidget {
  const IntervalTimer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "IntervalTimer",
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.deepOrange,
        backgroundColor: Colors.blueGrey[800],
        fontFamily: 'sans-serif'),
      home: Home(),
      //home: LoginPage(),
    );
  }

}

