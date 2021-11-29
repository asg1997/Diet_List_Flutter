import 'package:diet_list_flutter/Models/recipe_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class Dish {
  String name;
  String imageLink;
  Recipe recipe;

  Dish(this.name, this.imageLink, this.recipe);

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}