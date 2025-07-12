// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carp_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarpFood _$CarpFoodFromJson(Map<String, dynamic> json) => CarpFood(
  name: json['food_name'] as String,
  calories: (json['calories'] as num).toInt(),
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$CarpFoodToJson(CarpFood instance) => <String, dynamic>{
  'food_name': instance.name,
  'calories': instance.calories,
  'image_url': instance.imageUrl,
};
