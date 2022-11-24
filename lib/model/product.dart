class Product {
  int id = -1;
  String image = '';
  String name = '';
  int price = 0;
  Product();
  Product.add(this.id, this.image, this.name, this.price);
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    price = json['price'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
