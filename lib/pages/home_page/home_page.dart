import 'package:bandongho/model/product.dart';
import 'package:bandongho/model/product_type.dart';
import 'package:bandongho/pages/home_page/widget/item_draw_home_page.dart';
import 'package:bandongho/pages/home_page/widget/item_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/new_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/product_type_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> _NewProduct = [
    Product.add(
        0,
        'https://cdn2.yame.vn/pimg/ao-thun-co-tru-on-gian-y-nguyen-ban-ver114-0021537/d0881d96-7900-e300-1318-00199f364dc3.jpg',
        'Áo Thun Cổ Trụ Đơn Giản Y Nguyên Bản Ver114',
        287000),
    Product.add(
        1,
        'https://cdn2.yame.vn/pimg/ao-thun-co-tru-on-gian-y-nguyen-ban-ver99-0021355/1e17acf2-ea20-a000-0a3a-0019a4b9e73b.jpg',
        'Áo Thun Cổ Trụ Đơn Giản Y Nguyên Bản Ver99',
        257000),
    Product.add(
        2,
        'https://cdn2.yame.vn/pimg/ao-khoac-classic-on-gian-y-nguyen-ban-ver6-0020376/ccf7879c-9cbf-3d01-eff5-0018a182fb7f.jpg',
        'Áo Khoác Classic Tối Giản Ver',
        385000),
    Product.add(
        3,
        'https://cdn2.yame.vn/pimg/ao-khoac-khong-non-tieu-chuan-truot-nuoc-on-gian-12vahdt-van-xuan-kien-quoc-ver3-0020233/12985083-7514-8201-85e7-0018966ba9ac.jpg',
        'Áo Khoác Lá Cổ Đơn Giản 12VAHDT Vạn Xuân Kiến Quốc Ver3',
        455000),
    Product.add(
        4,
        'https://cdn2.yame.vn/pimg/so-mi-nam-no-style-td-km18-0018246/31aadf2f-485f-0200-f8e0-001823d06909.jpg',
        'Áo Sơ Mi Tay Dài Sợi Modal Tối Giản M11',
        255000),
    Product.add(
        5,
        'https://cdn2.yame.vn/pimg/so-mi-tay-dai-on-gian-m36-0020691/b92a19a7-1831-2000-29af-0018ff066f76.jpg',
        'Áo Sơ Mi Tay Dài Sợi Modal Đơn Giản M36',
        285000),
  ];
  final List<ProductType> _productTypes = [
    ProductType(id: 0, name: 'T-SHIRTS', products: [
      Product.add(
          0,
          'https://cdn2.yame.vn/pimg/ao-thun-co-tru-on-gian-y-nguyen-ban-ver114-0021537/d0881d96-7900-e300-1318-00199f364dc3.jpg',
          'Áo Thun Cổ Trụ Đơn Giản Y Nguyên Bản Ver114',
          287000),
      Product.add(
          1,
          'https://cdn2.yame.vn/pimg/ao-thun-co-tru-on-gian-y-nguyen-ban-ver99-0021355/1e17acf2-ea20-a000-0a3a-0019a4b9e73b.jpg',
          'Áo Thun Cổ Trụ Đơn Giản Y Nguyên Bản Ver99',
          257000),
    ]),
    ProductType(id: 1, name: 'SHIRTS', products: [
      Product.add(
          2,
          'https://cdn2.yame.vn/pimg/ao-khoac-classic-on-gian-y-nguyen-ban-ver6-0020376/ccf7879c-9cbf-3d01-eff5-0018a182fb7f.jpg',
          'Áo Khoác Classic Tối Giản Ver',
          385000),
      Product.add(
          3,
          'https://cdn2.yame.vn/pimg/ao-khoac-khong-non-tieu-chuan-truot-nuoc-on-gian-12vahdt-van-xuan-kien-quoc-ver3-0020233/12985083-7514-8201-85e7-0018966ba9ac.jpg',
          'Áo Khoác Lá Cổ Đơn Giản 12VAHDT Vạn Xuân Kiến Quốc Ver3',
          455000),
    ]),
    ProductType(id: 3, name: 'COATS', products: [
      Product.add(
          4,
          'https://cdn2.yame.vn/pimg/so-mi-nam-no-style-td-km18-0018246/31aadf2f-485f-0200-f8e0-001823d06909.jpg',
          'Áo Sơ Mi Tay Dài Sợi Modal Tối Giản M11',
          255000),
      Product.add(
          5,
          'https://cdn2.yame.vn/pimg/so-mi-tay-dai-on-gian-m36-0020691/b92a19a7-1831-2000-29af-0018ff066f76.jpg',
          'Áo Sơ Mi Tay Dài Sợi Modal Đơn Giản M36',
          285000),
    ]),
    ProductType(id: 4, name: 'TROUSERS', products: [
      Product.add(
          6,
          'https://cdn2.yame.vn/pimg/quan-tay-y2010-hg17-0019806/783c439e-0473-3300-079f-0018b9fb8fee.jpg',
          'Quần Tây Tối Giản HG17',
          325000),
      Product.add(
          7,
          'https://cdn2.yame.vn/pimg/quan-jean-slimfit-on-gian-b35-0021662/498e72df-62af-d600-d1a7-00199f35feb8.jpg',
          'Quần Jean Slimfit Đơn Giản B35',
          427000),
    ]),
    ProductType(id: 5, name: 'SHORT', products: [
      Product.add(
          8,
          'https://cdn2.yame.vn/pimg/quan-short-on-gian-y-original-ver5-0020275/6da7a33f-4b21-1e00-504e-0018680c10ae.jpg',
          'Quần Short Tối Giản Ver5',
          285000),
      Product.add(
          9,
          'https://cdn2.yame.vn/pimg/quan-short-on-gian-y-nguyen-ban-ver34-0021009/2588927b-5a1f-d600-73ac-001983bb30b0.jpg',
          'Quần Short Đơn Giản Y Nguyên Bản Ver34',
          287000),
    ])
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            NewProductWidget(
                sizeHeight: 400,
                sizeWidth: size.width,
                newProducts: _NewProduct),
            ProductTypeWidget(
                sizeHeight: 400,
                sizeWidth: size.width,
                productTypes: _productTypes),
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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Color(0xff5956E9),
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
    );
  }
}
