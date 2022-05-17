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
    return WillPopScope(
      onWillPop: () async {
        // async 필수
        // return true : pop 가능
        // return false : pop 불가능
        final canPop =
            Navigator.of(context).canPop(); //  이렇게 변수에 담아놓고 조건문으로 사용 가능
        return false; // 시스템 뒤로가기 버튼을 눌러도 동작 안함
      },
      child: MainLayout(
        title: "Home Screen",
        children: [
          ElevatedButton(
            onPressed: () {
              // pop을 할 수 있는 상태인지 알 수 있음
              print(Navigator.of(context).canPop());
            },
            child: Text("canPop"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
              // 우리가 더이상 뒤로 갈 페이지가 없을 경우 안넘어가짐!
            },
            child: Text("maybePop"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Pop"),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOne(number: 123),
                ),
              );

              print(result);
            },
            child: Text('push'),
          ),
        ],
      ),
    );
  }
}
