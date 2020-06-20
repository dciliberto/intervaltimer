import 'package:flutter/material.dart';
import 'package:interval_timer/home_body.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interval Timer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Interval Timer'),
        ),
        body: Column(
          children: <Widget>[
            HomeBody(),
          ],
        ),
      ),
    );
  }
}