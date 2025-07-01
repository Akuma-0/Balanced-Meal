// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carp_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarpFood _$CarpFoodFromJson(Map<String, dynamic> json) => CarpFood(
  name: json['name'] as String,
  calories: (json['calories'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$CarpFoodToJson(CarpFood instance) => <String, dynamic>{
  'name': instance.name,
  'calories': instance.calories,
  'imageUrl': instance.imageUrl,
};
