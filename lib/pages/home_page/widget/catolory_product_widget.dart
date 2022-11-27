import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../../provider/result_list_product_provider.dart';
import '../../product_detail_page/product_detail_page.dart';

class CateloryProductWidget extends StatefulWidget {
  const CateloryProductWidget(
      {super.key, required this.height, required this.catelorys});
  final double height;
  final List<String> catelorys;
  @override
  State<CateloryProductWidget> createState() => _CateloryProductWidgetState();
}

class _CateloryProductWidgetState extends State<CateloryProductWidget> {
  int _isSelect = 0;
  late ResultListProductProviver prov;
  @override
  Widget build(BuildContext context) {
    prov = Provider.of<ResultListProductProviver>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: widget.height,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.catelorys.length,
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
                    '${widget.catelorys[index]}',
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
            child: prov.ListProductByCatelory(widget.catelorys[_isSelect])
                        .length >
                    0
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        prov.ListProductByCatelory(widget.catelorys[_isSelect])
                            .length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                  product: prov.ListProductByCatelory(
                                      widget.catelorys[_isSelect])[index]),
                            )),
                        child: Container(
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
                                          border:
                                              Border.all(color: Colors.black)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 100,
                                            ),
                                            Text(
                                              prov.ListProductByCatelory(
                                                      widget.catelorys[
                                                          _isSelect])[index]
                                                  .name,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              prov.ListProductByCatelory(
                                                      widget.catelorys[
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  Text(
                                                      prov.ListProductByCatelory(
                                                                  widget.catelorys[
                                                                      _isSelect])[
                                                              index]
                                                          .unitPrice
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough)),
                                                  Spacer(),
                                                  Text(
                                                      '${prov.ListProductByCatelory(widget.catelorys[_isSelect])[index].price()} vnd',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ],
                                              ),
                                            )
                                          ]),
                                    )),
                                Positioned(
                                    bottom: widget.height - 200,
                                    left: 50,
                                    height: 150,
                                    width: 150,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/image.webp',
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                              ],
                            )),
                      );
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
