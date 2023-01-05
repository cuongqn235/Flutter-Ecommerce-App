import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../provider/result_user_provider.dart';
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
  late UserProvider prov;
  final textController = TextEditingController();
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    prov = Provider.of<UserProvider>(context, listen: true);
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
                        onPressed: () async {
                          await prov
                              .resetPassword(textController.text)
                              .then((value) => {
                                    // if (prov.code == 200)
                                    //   _showToast('Success', true)
                                    // else
                                    //   _showToast('Email is incorrect', false)
                                  });
                        },
                        colorText: Colors.black,
                      ),
                    ]),
              ),
            ],
          ),
          // if (prov.statusResult == Status.SUCCESS) showCustomToast()
        ],
      ),
    );
  }

  _showToast(String msg, bool check) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          check
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            msg,
            style: TextStyle(color: check ? Colors.green : Colors.red),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
