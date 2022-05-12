import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller; // null이 가능하게 선언을 해보자
  final homeUrl = "https://blog.codefactory.ai";
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeFactory"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (controller == null) {
                return;
              }
              controller!
                  .loadUrl(homeUrl); // controller는 절대 null이 될 수 없다는걸 알려줘야함
            },
            icon: Icon(Icons.home),
          )
        ],
        backgroundColor: Colors.orange,
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
