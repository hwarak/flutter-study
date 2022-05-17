import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;

  CustomVideoPlayer({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    // initState에서 VideoPlayerController를 새로 생성하자
    // initState는 iniitializeController를 실행만 하고 끝날때까지 기다리진 않음
    iniitializeController();
  }

  iniitializeController() async {
    videoPlayerController = VideoPlayerController.file(
      // File 타입 : 실제 Flutter Framework에서 사용하고있는 File타입
      // XFile 타입 : ImagePicker에서만 사용하면 커스텀 파일 타입.
      // 이제 XFile타입을 Flutter에서 사용하는 File타입으로 바꿔줘야함
      // File 사용할때 dart.io패키지에 있는 클래스를 써야해!

      // widget.video : XFile형태
      // widget.video.path : File형태로 넣어줄 수 있음

      File(widget.video.path),
    );

    // initialize() : 초기화해라
    // await를 사용하려면 initState()를 async로 만들어야하지만
    // initState()는 sync로 만들어야해서 불가능함... 어떡함?
    // 함수를 만들어야해!!! iniitializeController()만들어줌
    await videoPlayerController!.initialize();

    setState(() {
      // 비디오 컨트롤러를 생성했으니 비디오컨트롤러에 맞게 UI를 새로 빌드해라
    });
  }

  @override
  Widget build(BuildContext context) {
    // videoPlayerController가 initialize 될 때까지 기다려야
    // videoPlayerController에 값이 들어갈텐데
    // videoPlayerController 값이 처음에 null일때
    // build가 실행될 수도 있어! 왜? iniitializeController()는 동기거든
    // 그래서 null처리 해줘야함. null일 경우 로딩바 추가
    if (videoPlayerController == null) return CircularProgressIndicator();

    return AspectRatio(
      // 원본 바율로 확인 가능
      aspectRatio: videoPlayerController!.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(videoPlayerController!),
          _Controls(),
        ],
      ),
    );
  }
}

class _Controls extends StatelessWidget {
  const _Controls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          renderIconButton(
            onPressed: () {},
            iconData: Icons.rotate_left,
          ),
          renderIconButton(
            onPressed: () {},
            iconData: Icons.play_arrow,
          ),
          renderIconButton(
            onPressed: () {},
            iconData: Icons.rotate_right,
          ),
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
