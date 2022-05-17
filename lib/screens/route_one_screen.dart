import 'package:flutter/material.dart';
import 'package:flutter_project/screens/route_two_screen.dart';

import '../layouts/main_layout.dart';

class RouteOne extends StatelessWidget {
  final int number;
  const RouteOne({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Route One",
      children: [
        Text(
          number.toString(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('pop'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteTwo(),
                  settings: RouteSettings(arguments: 789),
                ),
              );
            },
            child: Text("push"))
      ],
    );
  }
}
