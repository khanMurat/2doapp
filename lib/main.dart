import 'package:do2app/constant.dart';
import 'package:do2app/screens/login-screen.dart';
import 'package:do2app/screens/registration_screen.dart';
import 'package:do2app/screens/welcome_screen.dart';
import 'package:do2app/task_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'barScreens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: TwodoApp(),
    ),
  );
}

class TwodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kScaffoldBcolor,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
