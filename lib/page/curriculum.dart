import 'package:flutter/material.dart';

class Curriculum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CurriculumPage();
  }

}

class CurriculumPage extends State<Curriculum>{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text("Curriculum"),
        ),
      ),
    );
  }

}