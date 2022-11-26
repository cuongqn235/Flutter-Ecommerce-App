import 'package:bandongho/model/product.dart';
import 'package:bandongho/pages/product_detail_page/product_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../values/app_text_style.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget(
      {super.key,
      required this.product,
      required this.sizeHeight,
      required this.sizeWidth});
  final double sizeHeight;
  final double sizeWidth;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: product),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 30, bottom: 10),
        height: sizeHeight,
        width: sizeWidth - 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ]),
        child: Column(children: [
          Expanded(
              flex: 7,
              child: CachedNetworkImage(
                imageUrl: product.images[0].link,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 40,
                ),
              )),
          Container(
            height: 30,
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            child: Text(
              product.name,
              style: AppTextStyle.textStyleProductName,
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Text(
              '${product.price} \$',
              style: AppTextStyle.textStylePrice,
            ),
          ),
        ]),
      ),
    );
  }
}
