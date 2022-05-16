import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/constant/color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [123, 456, 789];
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
              _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(
                onPressed: onRandomNumberGenerate,
              )
            ],
          ),
        ),
      ),
    );
  }

  onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length < 3) {
      newNumbers.add(rand.nextInt(1000));
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "랜덤숫자 생성기",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: RED_COLOR,
            ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (x) => Padding(
                padding: EdgeInsets.only(
                  bottom: x.key == 2 ? 0 : 16.0,
                ),
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map((e) => Image.asset(
                            'assets/images/$e.png',
                            height: 70.0,
                            width: 50.0,
                          ))
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR, //primary : 주 색상, 활성화가 되었을때 보이는 색상을 의미함
        ),
        onPressed: onPressed,
        child: const Text("생성하기"),
      ),
    );
  }
}
