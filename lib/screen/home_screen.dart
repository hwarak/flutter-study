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
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TestWidget(
              // 우리가 build 타임에 모든 값들을 다 알 수 있을때만 const를 쓸 수 있다
              // "test1" 이라는 글자는 build타임때 변경 안되니까 사용 가능
              label: "test1",
            ),
            TestWidget(
              label: "test2",
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("build!!"))
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;
  const TestWidget({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$label build 실행');
    return Container(
      child: Text(label),
    );
  }
}
