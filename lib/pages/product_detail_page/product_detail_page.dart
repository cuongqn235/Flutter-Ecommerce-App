import 'package:bandongho/model/product.dart';
import 'package:bandongho/values/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../values/app_text_style.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isFavorite = false;
  int _isSelect = 0;
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
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
          ),
          const IconButton(
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
            PageView.builder(
                itemCount: widget.product.imgs.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    _isSelect = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height / 2,
                    child: Stack(
                      children: [
                        // CachedNetworkImage(
                        //   height: size.height / 2,
                        //   width: size.width,
                        //   imageUrl: widget.product.imgs[index].imageUrl,
                        //   imageBuilder: (context, imageProvider) => Container(
                        //     decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: imageProvider,
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //   ),
                        //   placeholder: (context, url) => const Center(
                        //     child: Text(
                        //       'Loading...',
                        //       style:
                        //           TextStyle(fontSize: 20, color: Colors.green),
                        //     ),
                        //   ),
                        //   errorWidget: (context, url, error) => const Icon(
                        //     Icons.error,
                        //     color: Colors.red,
                        //   ),
                        // ),
                        Image.asset(widget.product.imgs[index].imageUrl,
                            fit: BoxFit.fill)
                      ],
                    ),
                  );
                }),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: size.height / 2 + 10),
                height: 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product.imgs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 10,
                      width: _isSelect == index ? 30 : 10,
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              _isSelect == index ? Colors.amber : Colors.black),
                    );
                  },
                )),
            Positioned(
              top: size.height / 2 + 30,
              left: 0,
              height: size.height / 2 - 100,
              width: size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Name: ${widget.product.name}',
                        style: AppTextStyle.textStyleProductName,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Price: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                      color: Colors.black38)
                                ]),
                            children: [
                              TextSpan(
                                  text: '${widget.product.price()} \$',
                                  style: AppTextStyle.textStylePrice)
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${widget.product.description}',
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          child: Text(
                            'Add cart',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
