import 'package:json_annotation/json_annotation.dart';

abstract class FoodBase {
  @JsonKey(name: 'food_name')
  final String name;
  final int calories;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  const FoodBase({
    required this.name,
    required this.calories,
    required this.imageUrl,
  });
}
