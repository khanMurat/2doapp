import 'package:do2app/bottom_button.dart';
import 'package:do2app/constant.dart';
import 'package:do2app/barScreens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool asyncCall = false;
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
    return ModalProgressHUD(
      inAsyncCall: asyncCall,
      child: Scaffold(
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
                  controller: _controllerEmail),
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
                  hintText: 'Enter your password',
                ),
                controller: _controllerPassword,
              ),
              SizedBox(
                height: 30,
              ),
              BottomButton(
                  text: 'LOGIN',
                  onPressed: () async {
                    setState(() {
                      asyncCall = true;
                    });
                    try {
                      var currentUser = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      Navigator.pushNamed(context, HomeScreen.id);
                      clearFunction();
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      asyncCall = false;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
