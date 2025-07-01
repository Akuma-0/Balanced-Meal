// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meat_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeatFood _$MeatFoodFromJson(Map<String, dynamic> json) => MeatFood(
  name: json['name'] as String,
  calories: (json['calories'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$MeatFoodToJson(MeatFood instance) => <String, dynamic>{
  'name': instance.name,
  'calories': instance.calories,
  'imageUrl': instance.imageUrl,
};
