import 'package:bandongho/enum/auth.dart';
import 'package:bandongho/pages/home_page/home_page.dart';
import 'package:bandongho/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../../provider/result_user_provider.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    UserProvider prov = Provider.of<UserProvider>(context, listen: false);
    prov.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider prov = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SplashScreenView(
          navigateRoute: prov.check == Auth.Authorized
              ? const HomePage()
              : const LoginPage(),
          duration: 2000,
          imageSize: 200,
          imageSrc: "assets/images/logo.png",
          text: "Online Store",
          textType: TextType.ColorizeAnimationText,
          textStyle: const TextStyle(
            fontSize: 40.0,
          ),
          colors: const [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
