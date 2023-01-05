import 'package:bandongho/pages/home_page/widget/brand_widget.dart';
import 'package:bandongho/pages/home_page/widget/drawer_widget.dart';
import 'package:bandongho/pages/home_page/widget/sale_widget.dart';
import 'package:bandongho/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/product_provider.dart';
import '../../provider/result_user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final proUser = Provider.of<UserProvider>(context, listen: false);
    proUser.getProfile();
    Provider.of<CartProvider>(context, listen: false).fetAndGetData();
    Provider.of<ProductProviver>(context, listen: false).fetAndGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              icon: const Icon(Icons.search, color: Colors.black)),
          const IconButton(
              onPressed: null,
              icon:
                  Icon(Icons.notifications_none_outlined, color: Colors.black)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              )),
        ],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SaleWidget(),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 20),
              child: Text(
                'Shop',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: BrandWidget()),
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerWidget(),
      ),
    );
  }
}
