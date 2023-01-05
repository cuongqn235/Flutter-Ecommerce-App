import 'package:bandongho/pages/product_detail_page/product_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../provider/cart_provider.dart';

class ListProductPage extends StatefulWidget {
  const ListProductPage({super.key, required this.products});
  final List<Product> products;
  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  List<int> _quantity = [];
  late CartProvider prov;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prov = Provider.of<CartProvider>(context, listen: false);
    for (int i = 0; i < widget.products.length; i++) {
      _quantity.add(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
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
        child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                            productID: widget.products[index].id,
                          )));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              child: Row(children: [
                Expanded(
                    child: CachedNetworkImage(
                  imageUrl: widget.products[index].imgs[0].imageUrl,
                  fit: BoxFit.cover,
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${widget.products[index].name}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 4,
                      ),
                      QuantityInput(index),
                      buttonAdd(widget.products[index], index)
                    ],
                  ),
                ))
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonAdd(Product product, int index) {
    return Ink(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () async {
          //     await prov.addCart(product,, _quantity[index]);
        },
        child: const Center(
          child: Text(
            'Add cart',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget QuantityInput(int index) {
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
              if (_quantity[index] == 1) return;
              setState(() {
                _quantity[index]--;
              });
            },
            icon: Icon(
              Icons.remove,
              color: _quantity[index] < 2 ? Colors.grey : Colors.black,
            ),
          ),
        )),
        Expanded(
            child: Text(
          '${_quantity[index]}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(left: BorderSide(color: Colors.grey))),
          child: IconButton(
            onPressed: () {
              setState(() {
                _quantity[index]++;
              });
            },
            icon: Icon(Icons.add),
          ),
        )),
      ]),
    );
  }
}
