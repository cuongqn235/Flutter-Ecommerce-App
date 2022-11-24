import 'package:bandongho/enum/status_api.dart';
import 'package:bandongho/provider/result_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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
  late ResultProviver prov;
  final textController = TextEditingController();
  late FToast fToast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    prov = Provider.of<ResultProviver>(context, listen: true);
    return Container(
      color: Colors.black26,
      child: Stack(
        children: [
          Column(
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Enter your email for the verification proccess, we will send password to your email',
                        maxLines: 2,
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextFormField(
                        controller: textController,
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
                          labelStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
                          onPressed: () {
                            _resetPassword();
                          }),
                    ]),
              ),
            ],
          ),
          if (prov.statusResult == Status.NULL) Container(),
          if (prov.statusResult == Status.PROCESS)
            Container(
                height: size.height,
                alignment: Alignment.center,
                child: const CircularProgressIndicator()),
          // if (prov.statusResult == Status.SUCCESS) showCustomToast()
        ],
      ),
    );
  }

  void _resetPassword() {
    setState(() {
      prov.setStatusResult(Status.PROCESS);
      prov.resetPassword('cuongqn2023@gmail.com');
    });
  }
}
