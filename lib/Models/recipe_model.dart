import 'package:json_annotation/json_annotation.dart';
import 'ingredient_model.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  List<Ingredient> ingredients;
  String process;

  Recipe(this.ingredients, this.process);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}