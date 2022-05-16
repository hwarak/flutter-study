import 'package:flutter/material.dart';

class RouteThree extends StatefulWidget {
  RouteThree({Key? key}) : super(key: key);

  @override
  State<RouteThree> createState() => _RouteThreeState();
}

class _RouteThreeState extends State<RouteThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Route Three"),
      ),
    );
  }
}
