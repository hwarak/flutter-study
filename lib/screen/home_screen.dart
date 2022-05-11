import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // StatelessWidget를 상속받으려면 꼭! 오버라이드 해줘야하는게 있음
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
