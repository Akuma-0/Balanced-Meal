import 'package:balanced_meal/models/food_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vegetable_food.g.dart';

@JsonSerializable()
class VegetableFood extends FoodBase {
  const VegetableFood({
    required super.name,
    required super.calories,
    required super.imageUrl,
  });

  factory VegetableFood.fromJson(Map<String, dynamic> json) =>
      _$VegetableFoodFromJson(json);

  Map<String, dynamic> toJson() => _$VegetableFoodToJson(this);
}
