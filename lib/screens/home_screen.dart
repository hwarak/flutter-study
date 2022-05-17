import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: getBoxdecoration(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Logo(),
              SizedBox(
                  // 간격 줄려고 이렇게 쓰는 경우도 많음
                  height: 30.0),
              _AppName()
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration getBoxdecoration() {
    return BoxDecoration(
      // RadialGradient : 가운데부터 색이 동그랗게 퍼짐
      // LinearGradient : 시작부터 끝까지 일괄적으로 색이 점차 바뀐다.
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF2A3A7C),
          Color(0xff000118),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png');
  }
}

class _AppName extends StatelessWidget {
  const _AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Video",
          style: textStyle,
        ),
        Text(
          "Player",
          // copyWith() : 이미 설정해놓은 값들은 유지를 하고 추가값들만 덮어씌우자!
          style: textStyle.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
