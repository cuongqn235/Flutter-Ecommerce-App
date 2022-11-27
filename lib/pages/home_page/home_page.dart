import 'package:bandongho/pages/home_page/widget/brand_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/catolory_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/item_draw_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/result_list_product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final prov = Provider.of<ResultListProductProviver>(context, listen: false);
    prov.fetAndGetData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final prov = Provider.of<ResultListProductProviver>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: null, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: null,
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.black)),
        ],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 20, bottom: 30),
              child: Text(
                'Trending Now',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            BrandProductWidget(
              height: 420,
              brands: prov.brands,
            ),
            SizedBox(
              height: 20,
            ),
            CateloryProductWidget(
              height: 420,
              catelorys: prov.catelorys,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
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
