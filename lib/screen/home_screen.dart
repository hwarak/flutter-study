import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.red,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.orange,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.orange,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.red,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.orange,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.green,
                ),
              ],
            )),
      ),
    );
  }
}
