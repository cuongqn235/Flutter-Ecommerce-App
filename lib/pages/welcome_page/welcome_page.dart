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
        backgroundColor: AppColor.colorBG,
        body: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 70, left: 51),
              child: Text(
                'Find your Gadget',
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 65),
              ),
            ),
            Image.asset(
              AppImage.welcomeImage,
              fit: BoxFit.fill,
            ),
            Container(
              height: 70,
              width: 314,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 3))
                  ]),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
                child: const Text(
                  'Get started',
                  style: TextStyle(
                      color: Color(0xff5956E9),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false),
              ),
            ),
          ],
        ));
  }
}
