import 'package:flutter/material.dart';
import 'package:flutter_project/layouts/main_layout.dart';
import 'package:flutter_project/screens/route_three_screen.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // .of(context) : 위젯트리에서 제일 가까운 모달라우트를 가져올 수 있다.
    // 모달라우트는 풀 스크린을 얘기하는데 여기서는 RouteTwo임
    // 왜냐? 지금 RouteTwo build가 실행이 되어있을테니까
    // 고로 RouteTwo의 값을 가져오는거임!
    // 그리고 특정상황일때 ModalRoute를 못가져올수 있어서 빨간줄이 뜨지만
    // 지금 우리가 구현하고자 하는건 null이 될 일이 없어서 ModalRoute.of(context)! <- 느낌표 추가

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
        ElevatedButton(
            onPressed: () {
              // 우리가 지금까지는 [HomeScreen, RouteOne, RouteTwo, RouteThree...]
              // 이런식으로 페이지가 쌓였기 떄문에 RouteThree에서 pop()을 실행하면
              // RouteTwo가 나와야했었는데
              // pushReplacement를 사용하면
              // [HomeScreen, RouteOne, RouteTwo, RouteThree] -> [HomeScreen, RouteOne, RouteThree]
              // RouteTwo 를 지워버림 !! 대체하는것과 같지.
              // 그래서 지금 이 상태에서 RouteThree에서 pop() 실행하면 RouteOne으로 돌아감

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteThree(),
                ),
              );
            },
            child: Text("Push Replacement"))
      ],
    );
  }
}
