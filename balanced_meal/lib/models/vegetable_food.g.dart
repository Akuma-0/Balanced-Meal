// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetable_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VegetableFood _$VegetableFoodFromJson(Map<String, dynamic> json) =>
    VegetableFood(
      name: json['name'] as String,
      calories: (json['calories'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$VegetableFoodToJson(VegetableFood instance) =>
    <String, dynamic>{
      'name': instance.name,
      'calories': instance.calories,
      'imageUrl': instance.imageUrl,
    };
