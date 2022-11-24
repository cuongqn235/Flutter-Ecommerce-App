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
          height: 30,
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
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: _isSelect == index
                          ? Colors.red
                          : Color.fromRGBO(82, 80, 80, 1)),
                  alignment: Alignment.center,
                  width: (widget.sizeWidth) / 4,
                  child: Text(
                    '${widget.productTypes[index].name}',
                    style: TextStyle(
                        color: _isSelect == index
                            ? Colors.greenAccent
                            : Colors.greenAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: widget.sizeHeight - 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productTypes[_isSelect].products?.length,
            itemBuilder: (context, index) {
              return ItemProductWidget(
                product: widget.productTypes[_isSelect].products![index],
                sizeHeight: widget.sizeHeight,
                sizeWidth: widget.sizeWidth,
              );
            },
          ),
        ),
      ]),
    );
  }
}
