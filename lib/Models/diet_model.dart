import 'package:diet_list_flutter/Models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'menu_model.dart';

part 'diet_model.g.dart';

@JsonSerializable()
class Diet {
  String name;
  String description;
  String? diet;
  List<Product>? productList;
  List<Menu>? menu;

  Diet(this.name, this.description, this.diet, this.menu, this.productList);

  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);

}
