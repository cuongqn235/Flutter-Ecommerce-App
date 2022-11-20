import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {super.key,
      required this.size,
      required this.tittle,
      required this.onPressed});
  final String tittle;
  final Size size;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Color(0xff5956E9)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Container(
        height: 70,
        alignment: Alignment.center,
        child: Text(
          tittle,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      onPressed: () => onPressed(),
    );
  }
}
