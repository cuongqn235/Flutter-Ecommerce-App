import 'package:equatable/equatable.dart';

class Product extends Equatable {
  int id = -1;
  String name = '';
  int unitPrice = -1;
  String description = '';
  double discount = -1;
  List<Imgs> imgs = [];
  List<InventoryDTOS>? inventoryDTOS = [];
  int price() {
    int temp = unitPrice - (unitPrice * (discount / 100)).toInt();
    return temp;
  }

  Product();
  Product.add(this.id, this.name, this.unitPrice, this.description,
      this.discount, this.imgs, this.inventoryDTOS);

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    name = json['name'] ?? '';
    unitPrice = json['unitPrice'] ?? 0;
    description = json['description'] ?? '';
    discount = json['discount'] ?? '';
    if (json['imgs'] != null) {
      imgs = <Imgs>[];
      json['imgs'].forEach((v) {
        imgs.add(Imgs.fromJson(v));
      });
    }
    if (json['inventoryDTOS'] != null) {
      json['inventoryDTOS'].forEach((v) {
        inventoryDTOS!.add(InventoryDTOS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['inventoryDTOS'] = inventoryDTOS;
    data['unitPrice'] = unitPrice;
    data['description'] = description;
    data['discount'] = discount;
    if (imgs != null) {
      data['imgs'] = this.imgs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => name.hashCode;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
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

class InventoryDTOS {
  int size = 0;
  int quantity = 0;
  InventoryDTOS();
  InventoryDTOS.add(this.size, this.quantity);

  InventoryDTOS.fromJson(Map<String, dynamic> json) {
    size = json['size'] ?? 0;
    quantity = json['quantity'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    return data;
  }
}
