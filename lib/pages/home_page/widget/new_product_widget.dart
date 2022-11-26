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
