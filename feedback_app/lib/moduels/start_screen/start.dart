import 'package:feedback_app/moduels/login_screen/login.dart';
import 'package:feedback_app/shared_componant/reuseable_componant.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: InkWell(
                      child: Image.asset("assets/images/feedback.png"),
                      onTap: () {
                        navigateAndFinish(context,  LoginScreen());
                      }))),
        ],
      ),
    );
  }
}
