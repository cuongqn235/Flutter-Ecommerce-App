import 'package:bandongho/pages/home_page/widget/brand_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/catolory_product_widget.dart';
import 'package:bandongho/pages/home_page/widget/drawer_widget.dart';
import 'package:bandongho/pages/home_page/widget/sale_widget.dart';
import 'package:bandongho/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/result_list_product_provider.dart';
import '../../provider/result_user_provider.dart';

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
    final proUser = Provider.of<ResultUserProvider>(context, listen: false);
    proUser.getProfile();
    prov.fetAndGetData();
    Provider.of<CartProvider>(context, listen: false).fetAndGetData();
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
            const SaleWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
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
        child: DrawerWidget(),
      ),
    );
  }
}
