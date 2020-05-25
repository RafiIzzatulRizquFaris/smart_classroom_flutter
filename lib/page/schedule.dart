import 'package:flutter/material.dart';

class Schedule extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SchedulePage();
  }

}

class SchedulePage extends State<Schedule>{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text("Schedule"),
        ),
      ),
    );
  }

}