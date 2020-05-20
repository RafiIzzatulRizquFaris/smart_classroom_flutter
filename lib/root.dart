import 'package:flutter/material.dart';
import 'package:smartclassroomflutter/authentication.dart';
import 'package:smartclassroomflutter/home.dart';
import 'package:smartclassroomflutter/login.dart';

enum AuthStatus{
  NOT_DETERMINED,
  NOT_LOGIN,
  LOGGED_IN
}

class Root extends StatefulWidget{

  final BaseAuth baseAuth;

  Root({this.baseAuth});

  @override
  State<StatefulWidget> createState() {
    return RootPage();
  }

}

class RootPage extends State<Root>{

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String userId = "";

  @override
  void initState() {
    super.initState();
    widget.baseAuth.getCurrentUser().then((value){
      setState(() {
        if(value != null){
          userId = value.uid;
        }else{
          authStatus = value.uid == null ? AuthStatus.NOT_LOGIN : AuthStatus.LOGGED_IN;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.NOT_DETERMINED:
        return Login(
          baseAuth: widget.baseAuth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.NOT_LOGIN:
        return Login(
          baseAuth: widget.baseAuth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if(userId.length > 0 && userId != null){
          return Home(
            baseAuth: widget.baseAuth,
            userId: userId,
            logoutCallback: logoutCallback,
          );
        }else{
          return waitingScreen();
        }
        break;
      default:
        return waitingScreen();
    }
  }


  loginCallback() {
    widget.baseAuth.getCurrentUser().then((value) {
      setState(() {
        userId = value.uid;
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  logoutCallback() {
    setState(() {
      userId = "";
      authStatus = AuthStatus.NOT_LOGIN;
    });
  }

  waitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}