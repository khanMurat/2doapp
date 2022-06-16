// ignore_for_file: prefer_const_constructors
import 'package:do2app/screens/login-screen.dart';
import 'package:do2app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constant.dart';
import '../bottom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'checkimage.jpeg',
                child: Container(
                  height: 200,
                  child: Image.asset(
                    'assets/checkimage.jpeg',
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Task & 2 Do',
                        textStyle: const TextStyle(
                          color: Color(0xffc4821f),
                          fontFamily: 'BlackOpsOne',
                          fontSize: 40.0,
                        ),
                        speed: const Duration(milliseconds: 500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 64.0,
            ),
            BottomButton(
              text: 'LOGIN',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(
              height: 30,
            ),
            BottomButton(
              text: 'REGISTER',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
