import 'package:bandongho/pages/create_account_page/create_account_page.dart';
import 'package:bandongho/pages/home_page/home_page.dart';
import 'package:bandongho/pages/login_page/login_page.dart';
import 'package:bandongho/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/home': (context) => const HomePage()
      },
    );
  }
}
 // tìm hiểu thêm về theme và routes nhé 
