import 'package:flutter/material.dart';
import 'package:flutter_project/constant/color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "랜덤숫자 생성기",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: RED_COLOR,
                      ))
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: 123
                          .toString()
                          .split('')
                          .map((e) => Image.asset('assets/images/$e.png'))
                          .toList(),
                    ),
                    Row(),
                    Row(),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: RED_COLOR, //primary : 주 색상, 활성화가 되었을때 보이는 색상을 의미함
                  ),
                  onPressed: () {},
                  child: const Text("생성하기"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
