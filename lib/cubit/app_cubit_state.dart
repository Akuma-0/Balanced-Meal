part of 'app_cubit.dart';

@immutable
sealed class AppCubitState {}

final class AppCubitInitial extends AppCubitState {}
final class FoodDataLoaded extends AppCubitState {
  Map<String, List<FoodBase>> foodData ;
  FoodDataLoaded({required this.foodData});
}
