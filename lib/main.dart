import 'package:flutter/material.dart';
import 'welcome.dart';
import 'home.dart';
import 'login.dart';
import 'routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        //home: WelcomePage());
      initialRoute: WelcomePage.routeName,
      routes: routes,
    );
  }
}








