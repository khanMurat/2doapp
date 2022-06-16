import 'package:do2app/bottom_button.dart';
import 'package:do2app/constant.dart';
import 'package:do2app/barScreens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';

  @override
  State<RegistrationScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegistrationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  void clearFunction() {
    _controllerEmail.clear();
    _controllerPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'checkimage.jpeg',
                child: Container(
                  height: 300,
                  child: Image.asset(
                    'assets/checkimage.jpeg',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
              controller: _controllerEmail,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your at least 6 character password',
              ),
              controller: _controllerPassword,
            ),
            SizedBox(
              height: 30,
            ),
            BottomButton(
              text: 'REGISTER',
              onPressed: () async {
                try {
                  var _createUser = await _auth.createUserWithEmailAndPassword(
                      email: email!, password: password!);
                  if (_createUser != null) {
                    Navigator.pushNamed(context, HomeScreen.id);
                    clearFunction();
                  }
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
