import 'package:balanced_meal/models/carp_food.dart';
import 'package:balanced_meal/models/food_base.dart';
import 'package:balanced_meal/models/meat_food.dart';
import 'package:balanced_meal/models/vegetable_food.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
part 'app_cubit_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  Map<String, List<FoodBase>> foodData = {};
  AppCubit() : super(AppCubitInitial());

  Future<Map<String, List<FoodBase>>> loadFoodData() async {
    Map<String, List<FoodBase>> data = {};

    // Load food data from json files using food model fromJson method
    final vegetablesJson = await loadJsonData('vegetable.json');
    data['vegetables'] =
        vegetablesJson.map((item) => VegetableFood.fromJson(item)).toList();

    final meatsJson = await loadJsonData('meat.json');
    data['meats'] = meatsJson.map((item) => MeatFood.fromJson(item)).toList();

    final carbsJson = await loadJsonData('carb.json');
    data['carbs'] = carbsJson.map((item) => CarpFood.fromJson(item)).toList();

    foodData = data;
    emit(FoodDataLoaded(foodData: data));
    return data;
  }

  // This function loads and decodes the JSON file.
  Future<List<dynamic>> loadJsonData(String fileName) async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/$fileName',
    );
    final List<dynamic> data = json.decode(jsonString);
    return data;
  }
}
