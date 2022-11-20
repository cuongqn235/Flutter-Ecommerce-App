import 'package:bandongho/model/product.dart';
import 'package:flutter/material.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 100, left: 35),
          width: 230,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
              ),
              Text(
                '${product.name}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${product.price}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
        Positioned(
            height: 150,
            width: 150,
            top: 50,
            left: 80,
            child: ClipOval(
                child: Image.asset(
              product.image,
              fit: BoxFit.fill,
            )))
      ],
    );
  }
}
