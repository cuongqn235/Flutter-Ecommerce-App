import 'package:bandongho/model/product.dart';

class ProductType {
  int? id;
  String? name;
  List<Product>? products;

  ProductType({this.id, this.name, this.products});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
