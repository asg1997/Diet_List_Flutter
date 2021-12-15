// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diet _$DietFromJson(Map<String, dynamic> json) => Diet(
      json['name'] as String,
      json['description'] as String,
      json['diet'] as String,
      (json['dishes'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['productList'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DietToJson(Diet instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'diet': instance.diet,
      'productList': instance.productList,
      'dishes': instance.dishes,
    };
