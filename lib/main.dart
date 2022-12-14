import 'dart:io';

import 'package:bandongho/pages/cart_page/cart_page.dart';
import 'package:bandongho/pages/create_account_page/create_account_page.dart';
import 'package:bandongho/pages/home_page/home_page.dart';
import 'package:bandongho/pages/login_page/login_page.dart';
import 'package:bandongho/pages/search_page/search_page.dart';
import 'package:bandongho/pages/splash_screen_page/splash_screen_page.dart';
import 'package:bandongho/pages/wish_list_page/wish_list_page.dart';
import 'package:bandongho/provider/cart_provider.dart';
import 'package:bandongho/provider/product_detail_provider.dart';
import 'package:bandongho/provider/product_provider.dart';
import 'package:bandongho/provider/result_user_provider.dart';
import 'package:bandongho/provider/search_provider.dart';
import 'package:bandongho/provider/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/firebase_init.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductProviver(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductDetailProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
    ),
    ChangeNotifierProvider(create: (context) => WishListProvider())
  ], child: const FirebaseInit(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenPage(),
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/home': (context) => const HomePage(),
        '/cart': (context) => const CartPage(),
        '/search': (context) => const SearchPage(),
        '/wishlist': (context) => const WishListPage()
      },
    );
  }
}
 // t??m hi???u th??m v??? theme v?? routes nh?? 
