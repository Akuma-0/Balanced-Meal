import 'package:json_annotation/json_annotation.dart';
import 'food_base.dart';

part 'carp_food.g.dart';

@JsonSerializable()
class CarpFood extends FoodBase {
  const CarpFood({
    required String name,
    required int calories,
    required String imageUrl,
  }) : super(name: name, calories: calories, imageUrl: imageUrl);

  factory CarpFood.fromJson(Map<String, dynamic> json) =>
      _$CarpFoodFromJson(json);

  Map<String, dynamic> toJson() => _$CarpFoodToJson(this);
}
