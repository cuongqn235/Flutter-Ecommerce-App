import 'package:bandongho/model/product.dart';
import 'package:bandongho/pages/home_page/widget/item_draw_home_page.dart';
import 'package:bandongho/pages/home_page/widget/item_product_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categorys = ['Wearable', 'Laptops', 'Phones', 'Drones'];
  List<Product> products = [
    Product(
        image: 'assets/images/image.png', name: 'Apple Watch', price: '300'),
    Product(
        image: 'assets/images/image.png', name: 'Apple Watch', price: '300'),
    Product(
        image: 'assets/images/image.png', name: 'Apple Watch', price: '300'),
    Product(image: 'assets/images/image.png', name: 'Apple Watch', price: '300')
  ];
  int _isSelect = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pageViewController = PageController(viewportFraction: 0.8);
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
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
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 50),
              child: const Text(
                'Order online\ncollect in store',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorys.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _isSelect = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                      width: (size.width - 50) / (categorys.length),
                      child: Text(
                        '${categorys[index]}',
                        style: TextStyle(
                            color: _isSelect == index
                                ? Colors.purple
                                : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ItemProductWidget(
                    product: products[index],
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 20, right: 20),
              child: Text(
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
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
          Positioned(
              bottom: 30,
              left: 0,
              child: ItemDraw(tittle: 'Logout', iconItemDraw: Icons.logout))
        ]),
      ),
    );
  }
}
