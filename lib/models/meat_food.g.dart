// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meat_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeatFood _$MeatFoodFromJson(Map<String, dynamic> json) => MeatFood(
  name: json['food_name'] as String,
  calories: (json['calories'] as num).toInt(),
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$MeatFoodToJson(MeatFood instance) => <String, dynamic>{
  'food_name': instance.name,
  'calories': instance.calories,
  'image_url': instance.imageUrl,
};
