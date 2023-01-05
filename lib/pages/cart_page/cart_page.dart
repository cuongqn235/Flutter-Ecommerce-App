import 'package:bandongho/model/item_cart.dart';
import 'package:bandongho/provider/cart_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartProvider prov;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    prov = Provider.of<CartProvider>(context);
    return Scaffold(
      ///tach được widget appbar chung cho toàn app
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: prov.carts.length,
                itemBuilder: (context, index) => Container(
                  height: 150,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: prov.carts[index].product.imgs[0].imageUrl,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(prov.carts[index].product.name),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    Text('Price: ${prov.carts[index].total()}'),
                                    const Spacer(),
                                    Text(
                                        'Quantity: ${prov.carts[index].quantity}')
                                  ],
                                ),
                              ),
                              buttonRemove(() async {
                                await prov.deleteCart(prov.carts[index]);
                              })
                            ]),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 2))),
                        child: Text('TOTAL\n${prov.getTotal()} vnđ',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Ink(
                        height: 50,
                        width: size.width / 4,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color: Colors.black)),
                        child: InkWell(
                          onTap: () {
                            print('ok');
                          },
                          child: const Center(
                              child: Text(
                            'CONFIRM ODER',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonRemove(Function func) {
    return Ink(
      height: 35,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(50)),
      child: InkWell(
        onTap: () => func(),
        child: const Center(
          child: Text(
            'Remove',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget QuantityInput(BuildContext contextt, ItemCart itemCart) {
    return Builder(
      builder: (contextt) {
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
                  if (itemCart.quantity == 0)
                    prov.deleteCart(itemCart);
                  else
                    prov.updateCart(itemCart, false);
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
            )),
            Expanded(
                child: Text(
              '${itemCart.quantity}',
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
                  prov.updateCart(itemCart, true);
                },
                icon: Icon(Icons.add),
              ),
            )),
          ]),
        );
      },
    );
  }
}
