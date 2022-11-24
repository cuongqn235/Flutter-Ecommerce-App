import 'package:bandongho/pages/create_account_page/create_account_page.dart';
import 'package:bandongho/pages/home_page/home_page.dart';
import 'package:bandongho/pages/login_page/login_page.dart';
import 'package:bandongho/pages/product_detail_page/product_detail_page.dart';
import 'package:bandongho/provider/result_provider.dart';
import 'package:bandongho/provider/result_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ResultProviver(),
    ),
    ChangeNotifierProvider(
      create: (context) => ResultUserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // bool check = await context.read<ResultUserProvider>().checkUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
 // tìm hiểu thêm về theme và routes nhé 
