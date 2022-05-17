import 'package:flutter/material.dart';

import '../layouts/main_layout.dart';

class RouteOne extends StatefulWidget {
  RouteOne({Key? key}) : super(key: key);

  @override
  State<RouteOne> createState() => _RouteOneState();
}

class _RouteOneState extends State<RouteOne> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Route One",
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('pop'),
        ),
      ],
    );
  }
}
