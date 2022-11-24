import 'package:bandongho/model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left_sharp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: _isFavorite
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height / 2 + 30,
              child: CachedNetworkImage(
                imageUrl: widget.product.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
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
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              height: size.height / 2,
              width: size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    border: Border.all(color: Colors.green)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
