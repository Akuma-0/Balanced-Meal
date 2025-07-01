import 'package:balanced_meal/models/food_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vegetable_food.g.dart';

@JsonSerializable()
class VegetableFood extends FoodBase {
  const VegetableFood({
    required String name,
    required int calories,
    required String imageUrl,
  }) : super(name: name, calories: calories, imageUrl: imageUrl);

  factory VegetableFood.fromJson(Map<String, dynamic> json) =>
      _$VegetableFoodFromJson(json);

  Map<String, dynamic> toJson() => _$VegetableFoodToJson(this);
}
