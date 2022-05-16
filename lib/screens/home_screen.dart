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
      appBar: AppBar(title: Text("버튼"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("ButtonStyle"),
              style: ButtonStyle(
                // MaterialStateProperty 얘로 감싸줘야해
                // all : 모든 상황에서 적용하겠다

                // MaterialState
                // 1. hovered - 호버링 상태(마우스 커서를 올려놓음)
                // 2. focused - 포커스 됐을때 (텍스트 필드)
                // 3. pressed - 눌렀을때 (O)
                // 4. draged - 드래그 됐을때
                // 5. selected - 선택됐을때(체크박스, 라디오버튼)
                // 6. scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을때
                // 7. disabled - 비활성화 됐을 때 (O)
                // 8. error - 에러상태

                backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    }
                    return null;
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    // contains : 어떤값이 있는지 없는지 알 수 있다
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.red;
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  // primary : 배경색? 아님. 메인컬러임
                  primary: Colors.red,
                  // onPrimary : ElevatedButton에만 있음. 글자색과 클릭했을때의 애니메이션 효과 색이 정해진다.
                  onPrimary: Colors.black,
                  // shadowColor : 버튼 그림자 색
                  shadowColor: Colors.green,
                  // elevation : 3D 입체감의 높이
                  elevation: 10.0,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20.0,
                  ),
                  padding: EdgeInsets.all(32.0),
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  )),
              child: Text('ElevatedButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('OutlinedButton'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.brown,
              ),
              child: Text('TextButton'),
            )
          ],
        ),
      ),
    );
  }
}
