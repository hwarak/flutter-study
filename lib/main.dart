import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/route_one_screen.dart';
import 'package:flutter_project/screens/route_three_screen.dart';
import 'package:flutter_project/screens/route_two_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/one': (context) => RouteOne(),
        '/two': (context) => RouteTwo(),
        '/three': (context) => RouteThree(),
      },
    ),
  );
}
