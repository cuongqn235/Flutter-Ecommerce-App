import 'dart:convert';

import 'package:bandongho/model/product.dart';
import 'package:bandongho/pages/home_page/widget/item_draw_home_page.dart';
import 'package:bandongho/pages/home_page/widget/new_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/product_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/result_product_type_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> _NewProduct = [
    Product.add(
        13,
        [
          ImageURL.add(0,
              'https://m.media-amazon.com/images/I/71M6XscSKzL._AC_SR920,736_.jpg'),
          ImageURL.add(1,
              'https://m.media-amazon.com/images/I/81fFG4n8teL._AC_SR920,736_.jpg'),
          ImageURL.add(2,
              'https://m.media-amazon.com/images/I/71mRezkDWjL._AC_SR920,736_.jpg'),
        ],
        'Crocs',
        54),
    Product.add(
        14,
        [
          ImageURL.add(0,
              'https://m.media-amazon.com/images/I/71qvVfFIrGL._AC_SR920,736_.jpg'),
          ImageURL.add(1,
              'https://m.media-amazon.com/images/I/71nCA8-NFrL._AC_SR920,736_.jpg'),
          ImageURL.add(2,
              'https://m.media-amazon.com/images/I/71rgvHGKH4L._AC_SR920,736_.jpg'),
        ],
        'Orthofeet',
        104),
    Product.add(
        15,
        [
          ImageURL.add(0,
              'https://m.media-amazon.com/images/I/619v0zaoBoL._AC_SR920,736_.jpg'),
          ImageURL.add(1,
              'https://m.media-amazon.com/images/I/614VVH-14fL._AC_SR920,736_.jpg'),
          ImageURL.add(2,
              'https://m.media-amazon.com/images/I/61A72WRd5nL._AC_SR920,736_.jpg'),
        ],
        'adidas',
        44),
    Product.add(
        7,
        [
          ImageURL.add(19,
              'https://m.media-amazon.com/images/I/71QVtnu6LUL._AC_SR920,736_.jpg'),
          ImageURL.add(20,
              'https://m.media-amazon.com/images/I/61XZpMJxVkL._AC_SR920,736_.jpg'),
          ImageURL.add(21,
              'https://m.media-amazon.com/images/I/61EWApuM2OL._AC_SR920,736_.jpg'),
        ],
        'The North Face',
        148),
    Product.add(
        8,
        [
          ImageURL.add(22,
              'https://m.media-amazon.com/images/I/719feaCZaIL._AC_SR920,736_.jpg'),
          ImageURL.add(23,
              'https://m.media-amazon.com/images/I/617kwrNGhJL._AC_SR920,736_.jpg'),
          ImageURL.add(24,
              'https://m.media-amazon.com/images/I/613Oke1ZY+L._AC_SR920,736_.jpg'),
        ],
        'Oboz',
        149),
    Product.add(
        9,
        [
          ImageURL.add(25,
              'https://m.media-amazon.com/images/I/71FYChyqw0L._AC_SR920,736_.jpg'),
          ImageURL.add(26,
              'https://m.media-amazon.com/images/I/616QdhWn16L._AC_SR920,736_.jpg'),
          ImageURL.add(27,
              'https://m.media-amazon.com/images/I/616lgAGsyIL._AC_SR920,736_.jpg'),
        ],
        'Danner',
        159),
  ];
  late ResultProductTypeProviver prov;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    prov = Provider.of<ResultProductTypeProviver>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.amber),
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff5956E9),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20)),
            hintText: 'Search',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: size.height * (2 / 3),
                child: Stack(
                  children: [
                    Image.asset(
                      width: size.width,
                      'assets/images/sale.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        left: 15,
                        bottom: 15,
                        child: Container(
                          height: size.width / 2,
                          width: size.width / 2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Fashion sale',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.red,
                                        ),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)))),
                                    child: const Text('Check',
                                        style: TextStyle(
                                          color: Colors.white,
                                        )))
                              ]),
                        ))
                  ],
                )),
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Row(children: [
                RichText(
                    text: const TextSpan(
                        text: 'N',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: 'e',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'w\n',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'You’ve never seen it before!',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal))
                    ])),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text('View all...'),
                )
              ]),
            ),
            NewProductWidget(
                sizeHeight: 400,
                sizeWidth: size.width,
                newProducts: _NewProduct),
            ProductTypeWidget(
                sizeHeight: 450,
                sizeWidth: size.width,
                productTypes: prov.productTypes),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 20, right: 20),
              child: const Text(
                'See more...',
                style: TextStyle(fontSize: 18, color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff5956E9),
        child: Stack(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(
                  height: 150,
                ),
                ItemDraw(
                  tittle: 'Profile',
                  iconItemDraw: Icons.home,
                ),
                ItemDraw(
                    tittle: 'My orders',
                    iconItemDraw: Icons.sensor_occupied_rounded),
                ItemDraw(tittle: 'Favorites', iconItemDraw: Icons.favorite),
                ItemDraw(tittle: 'Delivery', iconItemDraw: Icons.card_travel),
                ItemDraw(tittle: 'Settings', iconItemDraw: Icons.settings),
              ]),
          const Positioned(
              bottom: 30,
              left: 0,
              child: ItemDraw(tittle: 'Logout', iconItemDraw: Icons.logout))
        ]),
      ),
    );
  }
}
