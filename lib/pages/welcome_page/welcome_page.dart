import 'dart:async';

import 'package:bandongho/provider/result_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../enum/auth.dart';
import '../../provider/result_list_product_provider.dart';
import '../../values/app_color.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late ResultUserProvider prov;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // prov = Provider.of<ResultUserProvider>(context, listen: false);
    // prov.checkLogin().then((value) {
    //   if (value == Auth.Authorized) {
    //     Navigator.of(context)
    //         .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    //   } else {
    //     Navigator.of(context)
    //         .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          child: Image.asset(
            'assets/images/background_image.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          height: size.height / 2,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 51),
                child: Text(
                  'Find your Gadget',
                  maxLines: 2,
                  style: TextStyle(
                      color: AppColor.colorText,
                      fontWeight: FontWeight.w800,
                      fontSize: 65,
                      shadows: [
                        Shadow(
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.white54)
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            offset: Offset(0, 3),
                            color: Colors.white38,
                            spreadRadius: 2),
                      ]),
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
