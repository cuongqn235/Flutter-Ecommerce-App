import 'package:bandongho/values/app_image.dart';
import 'package:flutter/material.dart';
import '../../values/app_color.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(
    //   Duration(seconds: 3),
    //   () => Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => LoginPage(),
    //       )),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 70, left: 51),
              child: Text(
                'Find your Gadget',
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 65,
                    shadows: [
                      Shadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black54)
                    ]),
              ),
            ),
            Image.asset(
              AppImage.welcomeImage,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: size.width / 2,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: Text(
                  'Get started',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false),
              ),
            ),
          ],
        ));
  }
}
