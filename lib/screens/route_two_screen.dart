import 'package:flutter/material.dart';
import 'package:flutter_project/layouts/main_layout.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // .of(context) : 위젯트리에서 제일 가까운 모달라우트를 가져올 수 있다.
    // 모달라우트는 풀 스크린을 얘기하는데 여기서는 RouteTwo임
    // 왜냐? 지금 RouteTwo build가 실행이 되어있을테니까
    // 고로 RouteTwo의 값을 가져오는거임!

    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: "Route Two",
      children: [
        Text(
          'arguments: $arguments',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("pop"),
        ),
        ElevatedButton(
          onPressed: () {
            //pushNamed 는 setting값을 쓸 수 없음.
            // 값을 전달해주고싶으면 파라미터에 바로 등록하면됨
            Navigator.of(context).pushNamed('/three', arguments: 999);
          },
          child: Text("Push Named"),
        ),
      ],
    );
  }
}
