import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed;

  CustomVideoPlayer({
    Key? key,
    required this.video,
    required this.onNewVideoPressed,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoPlayerController;
  Duration currentPosition = Duration();
  bool showControls = false;

  @override
  void initState() {
    super.initState();
    // initState에서 VideoPlayerController를 새로 생성하자
    // initState는 iniitializeController를 실행만 하고 끝날때까지 기다리진 않음
    iniitializeController();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // oldWidget : 새로운 위젯이 생성되기 전의 위젯
    // widget : 현재 위젯
    if (oldWidget.video.path != widget.video.path) {
      // 무조건 다른 영상이면
      iniitializeController();
    }
  }

  iniitializeController() async {
    currentPosition = Duration();
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

    // 영상이 실행 될 때마다, 컨트롤러의 값이 바뀔때마다 setStatet실행
    videoPlayerController!.addListener(
      () async {
        // 비디오 컨트롤러의 값이 변경될때마다 실행된다
        final currentPosition = videoPlayerController!.value.position;
        setState(() {
          this.currentPosition = currentPosition;
        });
      },
    );

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
      child: GestureDetector(
        onTap: () {
          setState(() {
            showControls = !showControls;
          });
        },
        child: Stack(
          children: [
            VideoPlayer(videoPlayerController!),
            if (showControls)
              _Controls(
                onForwardPressed: onForwardPressed,
                onPlayPressed: onPlayPressed,
                onReversePressed: onReversePressed,
                isPlaying: videoPlayerController!.value.isPlaying,
              ),
            if (showControls) _NewVideo(onPressed: widget.onNewVideoPressed),
            _SliderBottom(
              currentPosition: currentPosition,
              maxPosition: videoPlayerController!.value.duration,
              onSliderChanged: onSliderChanged,
            )
          ],
        ),
      ),
    );
  }

  void onSliderChanged(double value) {
    videoPlayerController!.seekTo(
      Duration(seconds: value.toInt()),
    );
  }

  void onForwardPressed() {
    // 현재 이 영상이 어떤 부분을 실행하고 있는지 알아야함
    final currentPosition = videoPlayerController!.value.position;

    // 비디오의 전체 길이를 가져올 수 있다.
    final maxPosition = videoPlayerController!.value.duration;

    Duration position = maxPosition; // 전체길이로 초기화!

    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      // 전체 비디오의 길이에서 3초를 뺀걸 초로 가져왔을때 현재포지션보다 길다면
      position = currentPosition + Duration(seconds: 3);
    }
    videoPlayerController!.seekTo(position); // 설정한 position으로 이동하기
  }

  void onPlayPressed() {
    // 이미 실행중이면 중지
    // 실행중이 아니면 실행
    setState(() {
      // build를 실행해야 하기 때문에 setState()에 넣어준다
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause(); // 중지
      } else {
        videoPlayerController!.play(); //실행
      }
    });
  }

  void onReversePressed() {
    // 현재 이 영상이 어떤 부분을 실행하고 있는지 알아야함
    final currentPosition = videoPlayerController!.value.position;

    Duration position = Duration(); // 우선 0초로 초기화!

    if (currentPosition.inSeconds > 3) {
      // 만약 currentPosition이 3초보다 작다면 ..! 예외가 생길 수 있다니깐
      // 만약 우리가 실행하고 있는 부분을 초로 받았을때 3초보다 더 지났다면
      position = currentPosition - Duration(seconds: 3);
    }
    videoPlayerController!.seekTo(position); // 설정한 position으로 이동하기
  }
}

class _Controls extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  const _Controls(
      {Key? key,
      required this.onPlayPressed,
      required this.onReversePressed,
      required this.onForwardPressed,
      required this.isPlaying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(
            onPressed: onReversePressed,
            iconData: Icons.rotate_left,
          ),
          renderIconButton(
            onPressed: onPlayPressed,
            iconData: isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          renderIconButton(
            onPressed: onForwardPressed,
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

class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const _NewVideo({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0, // 오른쪽 끝에서 0px만큼 이동시켜라
      child: IconButton(
        onPressed: onPressed,
        color: Colors.white,
        iconSize: 30.0,
        icon: Icon(Icons.photo_camera_back),
      ),
    );
  }
}

class _SliderBottom extends StatelessWidget {
  final Duration currentPosition;
  final Duration maxPosition;
  final ValueChanged<double> onSliderChanged;
  const _SliderBottom(
      {Key? key,
      required this.currentPosition,
      required this.maxPosition,
      required this.onSliderChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              '${currentPosition.inMinutes} : ${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Slider(
                max: maxPosition.inSeconds.toDouble(),
                min: 0,
                // 현재 double로 들어오는 value값은 이 영상의 위치임!!!
                // 그래서 이동한 포지션값을 duration값으로 변환할 수가있음
                onChanged: onSliderChanged,
                value: currentPosition.inSeconds.toDouble(),
              ),
            ),
            Text(
              '${maxPosition.inMinutes} : ${(maxPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
