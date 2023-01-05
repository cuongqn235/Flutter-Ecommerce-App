import 'dart:math';

import 'package:bandongho/pages/product_detail_page/product_detail_page.dart';
import 'package:bandongho/provider/product_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../model/product.dart';

class BrandWidget extends StatefulWidget {
  const BrandWidget({super.key});

  @override
  State<BrandWidget> createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  @override
  void initState() {
    final ProductProviver prov =
        Provider.of<ProductProviver>(context, listen: false);
    prov.fetAndGetData();
    super.initState();
  }

  int select = 0;
  @override
  Widget build(BuildContext context) {
    final ProductProviver prov = Provider.of<ProductProviver>(context);
    return SizedBox(
      child: Column(children: [
        SizedBox(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prov.brands.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    prov.setSelectBrand(index);
                    prov.listProductByBrand(prov.brands[index].id);
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Text(
                        prov.brands[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: prov.getSelectBrand == index
                                ? Colors.black
                                : Colors.grey),
                      )),
                );
              }),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: prov.listProductBrand.length,
              itemBuilder: (context, index) {
                return itemProduct(prov.listProductBrand[index]);
              }),
        ))
      ]),
    );
  }

  Widget itemProduct(Product product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black12,
            ),
          ]),
      height: 150,
      child: Row(
        children: [
          Expanded(
              child: CachedNetworkImage(
            imageUrl: product.imgs[0].imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          )),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(productID: product.id)));
            },
            child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                      maxLines: 2,
                    ),
                    Text(
                      'cateloryName',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          '\$${product.unitPrice}',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          '\$${product.price()}',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                )),
          )),
        ],
      ),
    );
  }
}
