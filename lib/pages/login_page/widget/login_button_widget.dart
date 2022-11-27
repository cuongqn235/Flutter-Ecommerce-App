import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {super.key,
      required this.tittle,
      required this.onPressed,
      required this.colorText});
  final String tittle;
  final Function onPressed;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: colorText == Colors.black ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: colorText == Colors.white
                ? Border.all(color: Colors.black)
                : Border()),
        alignment: Alignment.center,
        child: Text(
          tittle,
          style: TextStyle(
              color: colorText == Colors.black ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
      onTap: () => onPressed(),
    );
  }
}
