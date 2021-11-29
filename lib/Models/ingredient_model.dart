import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class Ingredient {
  String name;
  String amount;

  Ingredient(this.name, this.amount);

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
