import 'package:json_annotation/json_annotation.dart';
import 'dish_model.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class Menu {
  String mealType;
  List<Dish> dishes;

  Menu(this.mealType, this.dishes);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}