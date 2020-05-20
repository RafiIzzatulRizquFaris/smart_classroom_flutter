import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartclassroomflutter/authentication.dart';
import 'package:smartclassroomflutter/page/attendance.dart';
import 'package:smartclassroomflutter/page/course.dart';
import 'package:smartclassroomflutter/page/curriculum.dart';
import 'package:smartclassroomflutter/page/schedule.dart';

class Home extends StatefulWidget{

  final String userId;
  final BaseAuth baseAuth;
  final VoidCallback logoutCallback;

  Home({this.userId, this.baseAuth, this.logoutCallback});

  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }

}

class HomePage extends State<Home>{

  int _selectedIndex = 0;
  List<Widget> _selectedPage = [Attendance(), Course(), Curriculum(), Schedule()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.blue,
        child: Icon(Icons.settings_voice),
      ),
      body: Container(
        color: Colors.blue,
        child: SafeArea(
            child: Row(
              children: <Widget>[
                NavigationRail(
                  minWidth: 56.0,
                  groupAlignment: 1.0,
                  backgroundColor: Colors.blue,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  leading: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/smart-classroom-31459.appspot.com/o/profile.jpg?alt=media&token=b34999f2-4fb9-42e9-910b-97990c96ccb3",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 108,
                      ),
                      RotatedBox(
                        quarterTurns: -1,
                        child: IconButton(
                          icon: Icon(Icons.tune),
                          color: Color(0xffFCCFA8),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  selectedLabelTextStyle: TextStyle(
                    color: Color(0xffFCCFA8),
                    fontSize: 13,
                    letterSpacing: 0.8,
                    decorationThickness: 2.0,
                  ),
                  unselectedLabelTextStyle: TextStyle(
                    fontSize: 13,
                    letterSpacing: 0.8,
                  ),
                  destinations: [
                    buildRotatedTextRailDestination("Attendance"),
                    buildRotatedTextRailDestination("Course"),
                    buildRotatedTextRailDestination("Curriculum"),
                    buildRotatedTextRailDestination("Schedule"),
                  ],
                ),
                _selectedPage[_selectedIndex],
              ],
            )
        ),
      ),
    );
  }

  buildRotatedTextRailDestination(String s) {
    return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(s),
        ),
      ),
    );
  }

}