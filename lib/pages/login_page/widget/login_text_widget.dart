import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget(
      {super.key,
      required this.tittel,
      required this.isCheckUnderline,
      required this.ontap});
  final String tittel;
  final bool isCheckUnderline;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(),
      child: Text(
        tittel,
        style: TextStyle(
            color: Color(0xff5956E9),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            decoration: isCheckUnderline ? TextDecoration.underline : null),
      ),
    );
  }
}
