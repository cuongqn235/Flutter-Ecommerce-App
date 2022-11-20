import 'package:flutter/material.dart';

import 'login_button_widget.dart';

class LoginForgotPanel extends StatefulWidget {
  const LoginForgotPanel({super.key, required this.size, required this.ontap});
  final Size size;
  final Function ontap;

  @override
  State<LoginForgotPanel> createState() => _LoginForgotPanelState();
}

class _LoginForgotPanelState extends State<LoginForgotPanel> {
  bool _ischeck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ischeck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(
        children: [
          InkWell(
            onTap: () => widget.ontap(),
            child: Container(
              height: widget.size.height / 2,
            ),
          ),
          Container(
            height: widget.size.height / 2,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Enter your email for the verification proccess, we will send password to your email',
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      if (value.contains('@gmail.com')) {
                        setState(() {
                          _ischeck = !_ischeck;
                        });
                      } else {
                        setState(() {
                          _ischeck = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        _ischeck ? Icons.check_circle : Icons.error,
                        color: _ischeck ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  LoginButtonWidget(
                    tittle: 'Reset password',
                    size: widget.size,
                    onPressed: () {},
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
