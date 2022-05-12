import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Image.asset('assets/img/image_1.jpeg'),
          Image.asset('assets/img/image_2.jpeg'),
          Image.asset('assets/img/image_3.jpeg'),
          Image.asset('assets/img/image_4.jpeg'),
          Image.asset('assets/img/image_5.jpeg')
        ],
      ),
    );
  }
}
