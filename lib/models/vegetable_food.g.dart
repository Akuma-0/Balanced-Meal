// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetable_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VegetableFood _$VegetableFoodFromJson(Map<String, dynamic> json) =>
    VegetableFood(
      name: json['food_name'] as String,
      calories: (json['calories'] as num).toInt(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$VegetableFoodToJson(VegetableFood instance) =>
    <String, dynamic>{
      'food_name': instance.name,
      'calories': instance.calories,
      'image_url': instance.imageUrl,
    };
