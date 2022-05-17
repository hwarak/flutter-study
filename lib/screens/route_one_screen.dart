import 'package:flutter/material.dart';
import 'package:flutter_project/screens/route_two_screen.dart';

import '../layouts/main_layout.dart';

class RouteOne extends StatelessWidget {
  final int? number;
  const RouteOne({Key? key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Route One",
      children: [
        Text(
          number.toString(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('pop'),
        ),
        ElevatedButton(
          onPressed: () {
            // pop을 할 수 있는 상태인지 알 수 있음
            print(Navigator.of(context).canPop());
          },
          child: Text("canPop"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RouteTwo(),
                settings: RouteSettings(arguments: 789),
              ),
            );
          },
          child: Text("push"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
            // 우리가 더이상 뒤로 갈 페이지가 없을 경우 안넘어가짐!
          },
          child: Text("maybePop"),
        ),
      ],
    );
  }
}
