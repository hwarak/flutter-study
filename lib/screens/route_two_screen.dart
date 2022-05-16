import 'package:flutter/material.dart';

class RouteTwo extends StatefulWidget {
  RouteTwo({Key? key}) : super(key: key);

  @override
  State<RouteTwo> createState() => _RouteTwoState();
}

class _RouteTwoState extends State<RouteTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Route Two"),
      ),
    );
  }
}
