import 'package:flutter/material.dart';
import 'package:flutter_project/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  onButtonPressed() {
    // 뒤로가기
    // pop : 현재 화면을 터뜨리자!!
    Navigator.of(context).pop(maxNumber.toInt());
  }

  onSliderChanged(double val) {
    setState(() {
      // onChanged가 불릴때마다, 즉  Slider의 값이 변경이 될 때마다
      // maxNumber에 value를 저장을 하는데
      // value를 저장 하면 build를 다시 실행하게 할거야
      // build가 state에서 다시 실행이 되었으니 Slider도 다시 실행이 될거야
      // 어떤값으로? 'maxNumber = val'이렇게 변경을 해놓은 'value: maxNumber' 이 value값으로 ! Slider를 다시 랜더링 함

      maxNumber = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(
                maxNumber: maxNumber,
              ),
              _Footer(
                onButtonPressed: onButtonPressed,
                onSliderChanged: onSliderChanged,
                maxNumber: maxNumber,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.maxNumber, Key? key}) : super(key: key);

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: maxNumber
            .toInt()
            .toString()
            .split('')
            .map((e) => Image.asset(
                  'assets/images/$e.png',
                  width: 50.0,
                  height: 70.0,
                ))
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer(
      {Key? key,
      required this.onButtonPressed,
      this.onSliderChanged,
      required this.maxNumber})
      : super(key: key);

  final double maxNumber;
  final VoidCallback onButtonPressed;
  final ValueChanged<double>? onSliderChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          child: Text('저장'),
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR,
          ),
        )
      ],
    );
  }
}
