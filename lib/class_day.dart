import 'class_meal.dart';

class Day {
  String weekday;
  String date;
  List<Meal> meals;
  Day({required this.weekday, required this.date, required this.meals});

  createDay(String weekday, String date, List<Meal> meals) {
    this.weekday = weekday;
    this.date = date;
    this.meals = meals;
  }
}