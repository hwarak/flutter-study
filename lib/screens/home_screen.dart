import 'package:flutter/material.dart';
import 'package:flutter_project/components/custom_video_player.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: video != null ? renderVideo() : renderEmpty(),
      ),
    );
  }

  Widget renderVideo() {
    return Container(
      child: CustomVideoPlayer(
        // 비디오가 null이 될 수 있어서 빨간줄이 뜨지만, 우리는 무조건 값이 있을때만 실행할거라 !를 붙혀주자
        video: video!,
        onNewVideoPressed: onNewVideoPressed,
      ),
    );
  }

  Widget renderEmpty() {
    // 영상이 선택되지 않았을때 렌더링 하는 화면
    return Container(
      decoration: getBoxdecoration(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Logo(onTap: onNewVideoPressed),
            SizedBox(
                // 간격 줄려고 이렇게 쓰는 경우도 많음
                height: 30.0),
            _AppName()
          ],
        ),
      ),
    );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (video != null) {
      setState(() {
        this.video = video;
      });
    }
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
  final VoidCallback onTap;

  const _Logo({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset('assets/images/logo.png'),
      onTap: onTap,
    );
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
