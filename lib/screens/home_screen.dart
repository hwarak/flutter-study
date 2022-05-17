import 'package:flutter/material.dart';
import 'package:flutter_project/layouts/main_layout.dart';
import 'package:flutter_project/screens/route_one_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Home Screen",
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteOne(),
              ),
            );
          },
          child: Text('push'),
        ),
      ],
    );
  }
}
