class Product {
  int id = -1;
  List<ImageURL> images = [];
  String name = '';
  int price = 0;
  Product();
  Product.add(this.id, this.images, this.name, this.price);
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    if (json['image'] != null) {
      json['image'].forEach((v) {
        images!.add(new ImageURL.fromJson(v));
      });
    }
    name = json['name'] ?? '';
    price = json['price'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.images;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class ImageURL {
  int id = 0;
  String link = '';
  ImageURL.add(this.id, this.link);
  ImageURL.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
  }
}
