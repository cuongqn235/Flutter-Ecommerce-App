import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bandongho/pages/product_detail_page/product_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/result_list_product_provider.dart';

class SaleWidget extends StatefulWidget {
  const SaleWidget({super.key});

  @override
  State<SaleWidget> createState() => _SaleWidgetState();
}

class _SaleWidgetState extends State<SaleWidget> {
  @override
  void initState() {
    super.initState();
    final prov = Provider.of<ResultListProductProviver>(context, listen: false);
    prov.Top5SaleProduct();
  }

  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ResultListProductProviver>(context);
    return prov.loading
        ? CarouselSlider(
            options: CarouselOptions(
              height: 150,
              aspectRatio: 16 / 9,
              viewportFraction: 0.7,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: null,
              scrollDirection: Axis.horizontal,
            ),
            items: prov.top5SaleProduct.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: i),
                          ));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.redAccent),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 150,
                                child: CachedNetworkImage(
                                  imageUrl: i.imgs[0].imageUrl,
                                )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Spacer(),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText(i.name,
                                        textStyle: TextStyle(fontSize: 13),
                                        colors: colorizeColors)
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 20,
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      ColorizeAnimatedText('${i.discount}% off',
                                          textStyle: TextStyle(fontSize: 20),
                                          colors: colorizeColors)
                                    ],
                                  ),
                                ),
                                Spacer()
                              ],
                            ))
                          ],
                        )),
                  );
                },
              );
            }).toList(),
          )
        : const Center(
            child: Text('Loading...'),
          );
  }
}
