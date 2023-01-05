import 'package:bandongho/provider/wish_list_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../product_detail_page/product_detail_page.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  late WishListProvider prov;
  @override
  void initState() {
    super.initState();
    Provider.of<WishListProvider>(context, listen: false).getWishList();
  }

  @override
  Widget build(BuildContext context) {
    prov = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: prov.products.length,
            itemBuilder: (context, index) {
              return itemProduct(prov.products[index]);
            }),
      ),
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
            onTap: () async {
              await Navigator.push(
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
