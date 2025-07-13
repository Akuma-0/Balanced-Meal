import 'package:json_annotation/json_annotation.dart';
import 'food_base.dart';

part 'carp_food.g.dart';

@JsonSerializable()
class CarpFood extends FoodBase {
  const CarpFood({
    required super.name,
    required super.calories,
    required super.imageUrl,
  });

  factory CarpFood.fromJson(Map<String, dynamic> json) =>
      _$CarpFoodFromJson(json);

  Map<String, dynamic> toJson() => _$CarpFoodToJson(this);
}
