import 'package:bandongho/pages/product_detail_page/product_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../../provider/result_list_product_provider.dart';

class BrandProductWidget extends StatefulWidget {
  const BrandProductWidget(
      {super.key, required this.height, required this.brands});
  final double height;
  final List<String> brands;
  @override
  State<BrandProductWidget> createState() => _BrandProductWidgetState();
}

class _BrandProductWidgetState extends State<BrandProductWidget> {
  int _isSelect = 0;
  late ResultListProductProviver prov;
  @override
  Widget build(BuildContext context) {
    prov = Provider.of<ResultListProductProviver>(context);
    print(prov.ListProductByBrand(widget.brands[_isSelect]).length);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: widget.height,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.brands.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _isSelect = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${widget.brands[index]}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: _isSelect == index ? Colors.black : Colors.grey),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
            child: prov.ListProductByBrand(widget.brands[_isSelect]).length > 0
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: prov.ListProductByBrand(widget.brands[_isSelect])
                                .length >
                            4
                        ? 4
                        : prov.ListProductByBrand(widget.brands[_isSelect])
                            .length,
                    itemBuilder: (context, index) {
                      print('index =${index}');
                      return index == 3
                          ? Container(
                              width: size.width / 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.arrow_right_alt_outlined,
                                        size: 50,
                                        color: Colors.purple,
                                      )),
                                  Text(
                                    'See more...',
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: widget.height - 20,
                              width: size.width - 120,
                              padding: EdgeInsets.only(left: 30),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      height: widget.height - 120,
                                      width: size.width - 150,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailPage(
                                                      product:
                                                          prov.ListProductByBrand(
                                                                  widget.brands[
                                                                      _isSelect])[
                                                              index]),
                                            )),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 3),
                                                    blurRadius: 7,
                                                    color: Colors.black26)
                                              ],
                                              border: Border.all(
                                                  color: Colors.black)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 100,
                                                ),
                                                Text(
                                                  prov.ListProductByBrand(
                                                          widget.brands[
                                                              _isSelect])[index]
                                                      .name,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  prov.ListProductByBrand(
                                                          widget.brands[
                                                              _isSelect])[index]
                                                      .description,
                                                  maxLines: 4,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          prov.ListProductByBrand(
                                                                      widget.brands[
                                                                          _isSelect])[
                                                                  index]
                                                              .unitPrice
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough)),
                                                      Spacer(),
                                                      Text(
                                                          '${prov.ListProductByBrand(widget.brands[_isSelect])[index].price()} vnd',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      )),
                                  Positioned(
                                      bottom: widget.height - 200,
                                      left: 50,
                                      height: 150,
                                      width: 150,
                                      child: InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailPage(
                                                      product:
                                                          prov.ListProductByBrand(
                                                                  widget.brands[
                                                                      _isSelect])[
                                                              index]),
                                            )),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 7,
                                                    offset: Offset(0, 3),
                                                    color: Colors.black38)
                                              ],
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.amber)),
                                          child: ClipOval(
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              imageUrl: prov.ListProductByBrand(
                                                      widget.brands[
                                                          _isSelect])[index]
                                                  .imgs[0]
                                                  .imageUrl,
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Center(child: Text('Error')),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ));
                    },
                  )
                : Center(
                    child: WidgetCircularAnimator(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black26),
                      child: Image.asset('assets/images/noproduct.png'),
                    ),
                  )))
      ]),
    );
  }
}
