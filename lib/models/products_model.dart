// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize:
    json["total_size"];
    _typeId:
    json["type_id"];
    _offset:
    json["offset"];
    _products:
    List<ProductModel>.from(
        json["products"].map((x) => ProductModel.fromJson(x)));
  }
}

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? typeId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id:
    json["id"];
    name:
    json["name"];
    description:
    json["description"];
    price:
    json["price"];
    stars:
    json["stars"];
    img:
    json["img"];
    location:
    json["location"];
    createdAt:
    DateTime.parse(json["created_at"]);
    updatedAt:
    DateTime.parse(json["updated_at"]);
    typeId:
    json["type_id"];
  }
}
