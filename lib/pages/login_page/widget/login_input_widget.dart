import 'package:flutter/material.dart';

class LoginInputWidget extends StatefulWidget {
  final String type;
  final Size size;
  final Icon iconType;
  final bool isCheckObscureText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const LoginInputWidget(
      {super.key,
      required this.type,
      required this.size,
      required this.iconType,
      required this.isCheckObscureText,
      required this.textInputType,
      required this.controller});
  @override
  State<LoginInputWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginInputWidget> {
  late bool _passwordVisible;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.size.height / 10,
        child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              icon: widget.iconType,
              labelText: widget.type,
              suffixIcon: widget.isCheckObscureText == false
                  ? null
                  : IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
            ),
            obscureText: widget.isCheckObscureText
                ? !_passwordVisible
                : _passwordVisible,
            keyboardType: widget.textInputType));
  }
}
