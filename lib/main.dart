import 'dart:io';

import 'package:bandongho/pages/create_account_page/create_account_page.dart';
import 'package:bandongho/pages/home_page/home_page.dart';
import 'package:bandongho/pages/login_page/login_page.dart';
import 'package:bandongho/pages/splash_screen_page/splash_screen_page.dart';
import 'package:bandongho/provider/result_list_product_provider.dart';
import 'package:bandongho/provider/result_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ResultUserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ResultListProductProviver(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenPage(),
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
 // tìm hiểu thêm về theme và routes nhé 
