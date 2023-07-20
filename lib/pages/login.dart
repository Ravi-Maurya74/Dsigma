import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              child:
                  const Image(image: AssetImage("assets/images/curtains.png")),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(),
          )
        ],
      ),
    );
  }
}
