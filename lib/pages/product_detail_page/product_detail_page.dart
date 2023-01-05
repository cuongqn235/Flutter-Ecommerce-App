import 'package:bandongho/model/product.dart';
import 'package:bandongho/provider/cart_provider.dart';
import 'package:bandongho/provider/product_detail_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enum/status.dart';
import '../../provider/wish_list_provider.dart';
import '../../values/app_text_style.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productID});
  final int productID;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _isSelect = 0;
  int _quantity = 1;
  int size = 0;
  bool check = false;
  int selectSize = 0;
  late CartProvider provCart;
  late WishListProvider provWishlist;
  @override
  void initState() {
    provWishlist = Provider.of<WishListProvider>(context, listen: false);
    provWishlist
        .checkProductInWishList(widget.productID)
        .then((value) => check = provWishlist.getCheck());
    context
        .read<ProductDetailProvider>()
        .fetAndGetData(idProduct: widget.productID);
    super.initState();
  }

  @override
  void dispose() {
    provWishlist.saveWishList(widget.productID, check);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                check = !check;
              });
            },
            icon: check
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 30,
                  ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: context.watch<ProductDetailProvider>().status == Status.loading
            ? const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
              ))
            : context.watch<ProductDetailProvider>().status == Status.error
                ? const Text('Error')
                : SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      children: [
                        CarouselSlider(
                            options: CarouselOptions(
                              height: size.height / 3,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _isSelect = index;
                                });
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                            items: context
                                .watch<ProductDetailProvider>()
                                .product
                                .imgs
                                .map(
                              (i) {
                                return CachedNetworkImage(
                                  imageUrl: i.imageUrl,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
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
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ).toList()),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 10,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: context
                                  .watch<ProductDetailProvider>()
                                  .product
                                  .imgs
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 10,
                                  width: _isSelect == index ? 30 : 10,
                                  margin: EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: _isSelect == index
                                          ? Colors.amber
                                          : Colors.black),
                                );
                              },
                            )),
                        Expanded(
                          child: Container(
                            height: size.height / 2 - 100,
                            width: size.width,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Name: ${context.watch<ProductDetailProvider>().product.name}',
                                    style: AppTextStyle.textStyleProductName,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'Price: ',
                                        style: const TextStyle(
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
                                              text:
                                                  '\$${context.watch<ProductDetailProvider>().product.price()}',
                                              style:
                                                  AppTextStyle.textStylePrice)
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$${context.watch<ProductDetailProvider>().product.unitPrice}',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    context
                                        .watch<ProductDetailProvider>()
                                        .product
                                        .description,
                                    maxLines: 5,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  sizeInput(context
                                      .watch<ProductDetailProvider>()
                                      .product),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      quantityInput(context
                                          .watch<ProductDetailProvider>()
                                          .product),
                                      ElevatedButton(
                                          onPressed: () async {
                                            await context.read<CartProvider>().addCart(
                                                Provider.of<ProductDetailProvider>(
                                                        context,
                                                        listen: false)
                                                    .product,
                                                Provider.of<ProductDetailProvider>(
                                                        context,
                                                        listen: false)
                                                    .product
                                                    .inventoryDTOS![selectSize]
                                                    .size,
                                                _quantity);
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((states) =>
                                                          Colors.red),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)))),
                                          child: const Text(
                                            'Add cart',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ))
                                    ],
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget sizeInput(Product product) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product.inventoryDTOS?.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectSize = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color:
                            selectSize == index ? Colors.black : Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Text('${product.inventoryDTOS![index].size}'),
              ),
            );
          }),
    );
  }

  Widget quantityInput(Product product) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Row(children: [
        Expanded(
            child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey))),
          child: IconButton(
            onPressed: () {
              if (_quantity == 1 ||
                  product.inventoryDTOS![selectSize].quantity == 0) return;
              setState(() {
                _quantity--;
              });
            },
            icon: Icon(
              Icons.remove,
              color: _quantity < 2 ? Colors.grey : Colors.black,
            ),
          ),
        )),
        Expanded(
            child: Text(
          '$_quantity',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.grey))),
          child: IconButton(
            onPressed: () {
              if (_quantity == product.inventoryDTOS![selectSize].quantity) {
                return;
              }
              setState(() {
                _quantity++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        )),
      ]),
    );
  }
}
