import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/product.dart';
import '../../product_detail_page/product_detail_page.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailPage(productID: product.id)));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(3, 6),
                      blurRadius: 1,
                      color: Colors.black12)
                ]),
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: product.imgs[0].imageUrl,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  '${product.name}',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(overflow: TextOverflow.ellipsis, fontSize: 17),
                )),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${product.price()}\$',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              '${product.unitPrice} \$',
                              style: const TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        )))
              ],
            ),
          ),
          Positioned(
              right: 20,
              top: 20,
              height: 20,
              width: 50,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    '${product.discount}%',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
