import 'package:bandongho/pages/login_page/widget/login_button_widget.dart';
import 'package:bandongho/pages/login_page/widget/login_forgot_panel.dart';
import 'package:bandongho/pages/login_page/widget/login_input_widget.dart';
import 'package:bandongho/pages/login_page/widget/login_text_widget.dart';
import 'package:bandongho/values/app_color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _isLoadForgot = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoadForgot = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.colorBG,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 300,
                padding: const EdgeInsets.only(left: 50, top: 50),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 53),
                    text: 'Welcome\n',
                    children: [
                      TextSpan(
                          text: 'Back',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 53))
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height - 300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 36),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      LoginInputWidget(
                        type: 'E-mail',
                        size: size,
                        iconType: Icon(Icons.email),
                        isCheckObscureText: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginInputWidget(
                        type: 'Password',
                        size: size,
                        iconType: Icon(Icons.key),
                        isCheckObscureText: true,
                        textInputType: TextInputType.text,
                      ),
                      LoginTextWidget(
                          tittel: 'Forgot passcode?',
                          isCheckUnderline: true,
                          ontap: () {
                            setState(() {
                              _isLoadForgot = !_isLoadForgot;
                            });
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      LoginButtonWidget(
                          tittle: 'Login',
                          size: size,
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (route) => false);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10),
                        child: LoginTextWidget(
                            tittel: 'Create account',
                            isCheckUnderline: false,
                            ontap: () {
                              Navigator.pushNamed(context, '/create');
                            }),
                      ),
                    ]),
              ),
            ]),
            _isLoadForgot
                ? LoginForgotPanel(
                    size: size,
                    ontap: () {
                      setState(() {
                        _isLoadForgot = !_isLoadForgot;
                      });
                    },
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
