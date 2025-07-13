import 'package:balanced_meal/models/food_base.dart';

Map<String,double> priceAndCaloriesCalculator(Map<FoodBase, int> foodCount) {
  double totalPrice = 0.0;
  double totalCalories = 0.0;
  foodCount.forEach((food, count) {
    totalPrice += 12 * count; // Assuming FoodBase has a price property
    totalCalories += food.calories * count;
  });
  return {
    'totalPrice': totalPrice,
    'totalCalories': totalCalories,
  };
}
