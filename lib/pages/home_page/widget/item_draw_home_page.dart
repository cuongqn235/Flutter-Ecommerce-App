import 'package:flutter/material.dart';

class ItemDraw extends StatelessWidget {
  const ItemDraw(
      {super.key,
      required this.tittle,
      required this.iconItemDraw,
      required this.funcOntap});
  final String tittle;
  final IconData iconItemDraw;
  final Function funcOntap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        funcOntap;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Row(
          children: [
            Icon(
              iconItemDraw,
              color: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              tittle,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
