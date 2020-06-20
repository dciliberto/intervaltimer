import 'dart:async';

import 'package:flutter/material.dart';



class HomeBody extends StatefulWidget{
   @override
  _HomeBodyState createState() => _HomeBodyState();
}


class _HomeBodyState extends State<HomeBody> {
  
  int _roundHoursCounter = 0;
  int _roundMinutesCounter = 0;
  int _roundSecondsCounter = 0;

  int _roundHoursHolder = 0;
  int _roundMinutesHolder = 0;
  int _roundSecondsHolder = 0;

  int _restHoursCounter = 0;
  int _restMinutesCounter = 0;
  int _restSecondsCounter = 0;

  int _restHoursHolder = 0;
  int _restMinutesHolder = 0;
  int _restSecondsHolder = 0;

  int _repsCounter = 0;

  int _repsHolder = 0;
  
  Timer _roundTimer;
  Timer _restTimer;

  bool _roundFlag = true;
  //bool _restFlag = false;
  //var f  =  new NumberFormat('#0','en_US');
  //Duration time = Duration(minutes: 0, seconds: 0);
  void _pauseTimer(){
    if(_roundFlag){    
      _roundTimer.cancel();
    }
    else{
      _restTimer.cancel();
    }
  }
  

  void  _startTimer(){
    if(_roundFlag){
      _startRoundTimer();
    }
    else{
      _startRestTimer();
    }
  }

  void _startRoundTimer(){
    if(_roundTimer != null){
      _roundTimer.cancel();
    }
    _roundTimer = Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() {
        if(_roundSecondsCounter > 0){
          _roundSecondsCounter--;
        }
        else if(_roundMinutesCounter > 0){
          _roundMinutesCounter--;
          _roundSecondsCounter = 59;
        }
        else if(_roundHoursCounter > 0){
          _roundHoursCounter--;
          _roundMinutesCounter = 59;
          _roundSecondsCounter = 59;
        }
        else{
          _roundTimer.cancel();
          _roundFlag = false;
          _startRestTimer();
        }
        
      });
    });
  }

  void _startRestTimer(){
    if(_restSecondsCounter > 0){
          _restSecondsCounter--;
        }
        else if(_restMinutesCounter > 0){
          _restMinutesCounter--;
          _restSecondsCounter = 59;
        }
        else if(_restHoursCounter > 0){
          _restHoursCounter--;
          _restMinutesCounter = 59;
          _restSecondsCounter = 59;
        }
        else{
            _roundHoursCounter = _roundHoursHolder;
            _roundMinutesCounter = _roundMinutesHolder;
            _roundSecondsCounter = _roundSecondsHolder;

            _restHoursCounter = _restHoursHolder;
            _restMinutesCounter = _restMinutesHolder;
            _restSecondsCounter = _restSecondsHolder;
            if(_repsCounter > 0){
              _repsCounter--;
              _startRoundTimer();
            }
            else{
              _repsCounter = _repsHolder;
            }
        }
  }

  void _incrementRoundHours(){
    setState(() {
      if(_roundHoursCounter < 99){
      _roundHoursCounter++;
      _roundHoursHolder++;
      }
    });
  }

  void _incrementRoundMinutes(){
    setState(() {
      if(_roundMinutesCounter < 99){
      _roundMinutesCounter++;
      _roundMinutesHolder++;
      }
    });
  }

  void _incrementRoundSeconds(){
    setState(() {
      if(_roundSecondsCounter < 99){
      _roundSecondsCounter++;
      _roundSecondsHolder++;
      }
    });
  }

  void _decrementRoundHours(){
    setState(() {
      if(_roundHoursCounter != 0){
      _roundHoursCounter--;
      _roundHoursHolder--;
      }
    });
  }

  void _decrementRoundMinutes(){
    setState(() {
      if(_roundMinutesCounter != 0){
      _roundMinutesCounter--;
      _roundMinutesHolder--;
      }
    });
  }

  void _decrementRoundSeconds(){
    setState(() {
      if(_roundSecondsCounter != 0){
      _roundSecondsCounter--;
      _roundSecondsHolder--;
      }
    });
  }

  void _incrementRestHours(){
    setState(() {
      if(_restHoursCounter < 99){
      _restHoursCounter++;
      _restHoursHolder++;
      }
    });
  }

  void _incrementRestMinutes(){
    setState(() {
      if(_restMinutesCounter < 99){
      _restMinutesCounter++;
      _restMinutesHolder++;
      }
    });
  }

  void _incrementRestSeconds(){
    setState(() {
      if(_restSecondsCounter < 99){
      _restSecondsCounter++;
      _restSecondsHolder++;
      }
    });
  }

  

  void _decrementRestHours(){
    setState(() {
      if(_restHoursCounter != 0){
      _restHoursCounter--;
      _restHoursHolder--;
      }
    });
  }

  void _decrementRestMinutes(){
    setState(() {
      if(_restMinutesCounter != 0){
      _restMinutesCounter--;
      _restMinutesHolder--;
      }
    });
  }

  void _decrementRestSeconds(){
    setState(() {
      if(_restSecondsCounter != 0){
      _restSecondsCounter--;
      _restSecondsHolder--;
      }
    });
  }

  void _incrementRepCounter(){
    setState((){
      _repsCounter++;
      _repsHolder++;
    });
  }

  void _decrementRepCounter(){
    setState((){
      if (_repsCounter != 0){
      _repsCounter--;
      _repsHolder--;
      }
    });
  }

  

  String twoDigits(int input){
    if (input >= 10){
      return "$input";
    }
    return "0$input";
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(children: <Widget>[
      Text('Round', textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold),),
      Row(children: <Widget>[
        Column(children: <Widget>[
           RaisedButton(
          onPressed: () {_incrementRoundHours();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        Text(twoDigits(_roundHoursCounter), textScaleFactor: 2,),
        RaisedButton(onPressed: () {_decrementRoundHours();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        ],),
        Text(':', textScaleFactor: 2,),
        Column(children: <Widget>[
          RaisedButton(
          onPressed: () {_incrementRoundMinutes();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
          ),
          Text(twoDigits(_roundMinutesCounter), textScaleFactor: 2,),
          RaisedButton(onPressed: () {_decrementRoundMinutes();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        )
        ],),
        Text(':', textScaleFactor: 2,),
        Column(children: <Widget>[
          RaisedButton(
          onPressed: () {_incrementRoundSeconds();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        Text(twoDigits(_roundSecondsCounter), textScaleFactor: 2,),
        RaisedButton(onPressed: () {_decrementRoundSeconds();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        ],)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,),
      Text('Rest', textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold),),

      Row(children: <Widget>[
        Column(children: <Widget>[
           RaisedButton(
          onPressed: () {_incrementRestHours();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        Text(twoDigits(_restHoursCounter), textScaleFactor: 2,),
        RaisedButton(onPressed: () {_decrementRestHours();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        ],),
        Text(':', textScaleFactor: 2,),
        Column(children: <Widget>[
          RaisedButton(
          onPressed: () {_incrementRestMinutes();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
          ),
          Text(twoDigits(_restMinutesCounter), textScaleFactor: 2,),
          RaisedButton(onPressed: () {_decrementRestMinutes();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        )
        ],),
        Text(':', textScaleFactor: 2,),
        Column(children: <Widget>[
          RaisedButton(
          onPressed: () {_incrementRestSeconds();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        Text(twoDigits(_restSecondsCounter), textScaleFactor: 2,),
        RaisedButton(onPressed: () {_decrementRestSeconds();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
        ),
        ],)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,),
      Text('Reps',textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold),),
      Row(children: <Widget>[
        Column(children: <Widget>[
          RaisedButton(onPressed:  (){_incrementRepCounter();},
          child: Icon(Icons.add),
          color: Colors.blue,
          textColor:  Colors.white,
          elevation: 5,
          ),
          Text(_repsCounter.toString(), textScaleFactor: 2),
          RaisedButton(onPressed: (){_decrementRepCounter();},
          child: Icon(Icons.remove),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,)
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,)
      ,
      Row(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
         child: RaisedButton(onPressed: () {_startTimer();},
          child: Text('Start'),
          color: Colors.green,
          textColor: Colors.white,
          elevation: 5,
        ),),
        Container(
          margin: const EdgeInsets.all(10),
        child: RaisedButton(onPressed: () {_pauseTimer();},
          child: Text('Stop'),
          color: Colors.red,
          textColor: Colors.white,
          elevation: 5,
        ),),
        Container(
          margin: const EdgeInsets.all(10),
        child: RaisedButton(onPressed: () {_pauseTimer();},
          child: Text('Reset'),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 5,
         
        ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,)
     
     

     
      
    ],);

  }
}