import 'package:bandongho/model/product_type.dart';
import 'package:flutter/material.dart';

import 'item_product_widget.dart';

class ProductTypeWidget extends StatefulWidget {
  const ProductTypeWidget(
      {super.key,
      required this.sizeHeight,
      required this.sizeWidth,
      required this.productTypes});
  final double sizeHeight;
  final double sizeWidth;
  final List<ProductType> productTypes;

  @override
  State<ProductTypeWidget> createState() => _ProductTypeWidgetState();
}

class _ProductTypeWidgetState extends State<ProductTypeWidget> {
  int _isSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.sizeHeight,
      margin: EdgeInsets.only(top: 20),
      child: Column(children: [
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productTypes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _isSelect = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: _isSelect == index
                      ? const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 2, color: Colors.amber)))
                      : const BoxDecoration(),
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.productTypes[index].name}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productTypes[_isSelect].products?.length,
            itemBuilder: (context, index) {
              return ItemProductWidget(
                product: widget.productTypes[_isSelect].products![index],
                sizeHeight: widget.sizeHeight - 50,
                sizeWidth: widget.sizeWidth,
              );
            },
          ),
        ),
      ]),
    );
  }
}
