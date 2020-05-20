import 'package:flutter/material.dart';

class Course extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CoursePage();
  }

}

class CoursePage extends State<Course>{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text("Course"),
      ),
    );
  }

}