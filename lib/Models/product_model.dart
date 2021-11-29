import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  String name;
  String status;

  Product(this.name, this.status);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}