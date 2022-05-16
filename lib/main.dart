import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomeScreen extends StatelessWidget {
  // StatelessWidget를 상속받으려면 꼭! 오버라이드 해줘야하는게 있음
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff99231),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
