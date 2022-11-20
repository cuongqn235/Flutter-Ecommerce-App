import 'package:flutter/material.dart';

class ItemDraw extends StatelessWidget {
  const ItemDraw({super.key, required this.tittle, required this.iconItemDraw});
  final String tittle;
  final IconData iconItemDraw;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        children: [
          Icon(
            iconItemDraw,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            tittle,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
