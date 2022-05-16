import 'package:flutter/material.dart';

class RouteOne extends StatefulWidget {
  RouteOne({Key? key}) : super(key: key);

  @override
  State<RouteOne> createState() => _RouteOneState();
}

class _RouteOneState extends State<RouteOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Route One"),
      ),
    );
  }
}
