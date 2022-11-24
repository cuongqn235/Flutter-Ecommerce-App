import 'package:flutter/material.dart';

import '../../../model/product.dart';
import 'item_product_widget.dart';

class NewProductWidget extends StatelessWidget {
  const NewProductWidget(
      {super.key,
      required this.sizeHeight,
      required this.sizeWidth,
      required this.newProducts});
  final double sizeHeight;
  final double sizeWidth;
  final List<Product> newProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: sizeHeight,
      width: sizeWidth,
      child: Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 30),
            child: Row(children: [
              RichText(
                  text: const TextSpan(
                      text: 'N',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: 'e',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'w\n',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'You’ve never seen it before!',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal))
                  ])),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text('View all...'),
              )
            ]),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newProducts.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ItemProductWidget(
                      product: newProducts[index],
                      sizeHeight: sizeHeight,
                      sizeWidth: sizeWidth,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
