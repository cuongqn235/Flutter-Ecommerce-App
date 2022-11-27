import 'package:bandongho/pages/create_account_page/create_account_page.dart';
import 'package:bandongho/pages/home_page/home_page.dart';
import 'package:bandongho/pages/login_page/login_page.dart';
import 'package:bandongho/pages/welcome_page/welcome_page.dart';
import 'package:bandongho/provider/result_list_product_provider.dart';
import 'package:bandongho/provider/result_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // bool check = await context.read<ResultUserProvider>().checkUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
 // tìm hiểu thêm về theme và routes nhé 
