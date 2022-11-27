class Product {
  int id = -1;
  String name = '';
  int quantity = -1;
  int unitPrice = -1;
  String brandName = '';
  String cateloryName = '';
  String description = '';
  double discount = -1;
  List<Imgs> imgs = [];
  int price() {
    int temp = unitPrice - (unitPrice * (discount / 100)).toInt();
    return temp;
  }

  Product();
  Product.add(this.id, this.name, this.quantity, this.unitPrice, this.brandName,
      this.cateloryName, this.description, this.discount, this.imgs);

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    brandName = json['brand_name'];
    cateloryName = json['catelory_name'];
    description = json['description'];
    discount = json['discount'];
    if (json['imgs'] != null) {
      imgs = <Imgs>[];
      json['imgs'].forEach((v) {
        imgs!.add(Imgs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['unitPrice'] = this.unitPrice;
    data['brand_name'] = this.brandName;
    data['catelory_name'] = this.cateloryName;
    data['description'] = this.description;
    data['discount'] = this.discount;
    if (this.imgs != null) {
      data['imgs'] = this.imgs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Imgs {
  String imageUrl = '';
  String imageAlt = '';
  Imgs();
  Imgs.add(this.imageUrl, this.imageAlt);

  Imgs.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    imageAlt = json['imageAlt'] == null ? '' : json['imageAlt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['imageAlt'] = this.imageAlt;
    return data;
  }
}
