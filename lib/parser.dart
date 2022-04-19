import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'class_meal.dart';
import 'class_day.dart';
import 'main.dart';
import 'helpers.dart';

Future parser(String URL) async {
  print("start with parsing");
  final response = await http.Client().get(Uri.parse(URL));

  if (response.statusCode == 200) {
    var document = parse(response.body);

    var days = document.getElementsByClassName("fmc-day");
    //List<Day> week = []; // define the week from monday - Friday

    for (var day in days) {
      var head = day.getElementsByClassName("fmc-head")[0].text.trim();
      var date = day
          .getElementsByClassName("fmc-head")[0]
          .getElementsByClassName("light")[0]
          .text
          .trim();
      int index = head.indexOf(date); // find date in String
      String weekday =
          head.substring(0, index).trim(); // remove Date from String
      var dayMeals = day
          .getElementsByClassName("fmc-body")[0]
          .getElementsByClassName("fmc-items")[0]
          .getElementsByClassName("fmc-item");

      List<Meal> mealList = [];

      for (var i in dayMeals) {
        bool today;
        if (document.getElementsByClassName("fmc-today").length != 0) {
          //any((element) => false)
          if (document
                  .getElementsByClassName("fmc-today")[0]
                  .getElementsByClassName("fmc-head")[0]
                  .text
                  .trim() ==
              head) {
            today = true;
          } else {
            today = false;
          }
        } else {
          // today is weekend, there is no "fmc-today" tag
          // print("Heute ist Wochenende");
          today = false;
        }

        // get foodd typ SVG icon and let "checkFoodTyp" check what it is
        String foodTypSvg = i
            .getElementsByClassName("fmc-item-icon")[0]
            .getElementsByClassName("icon-food")[0]
            .getElementsByTagName("g")[0]
            .getElementsByTagName("path")[0]
            .attributes["d"]!
            .trim();
        String foodTyp = checkFoodTyp(foodTypSvg);
        //print("Foodtyp: " + foodTyp);

        // get element from parsing data
        String title =
            i.getElementsByClassName("fmc-item-title")[0].text.trim();
        String location =
            i.getElementsByClassName("fmc-item-location")[0].text.trim();
        String price =
            i.getElementsByClassName("fmc-item-price")[0].text.trim();
        Meal tempMeal = Meal(
            foodTyp: foodTyp,
            title: title,
            location: location,
            price: price,
            today: today);
        mealList.add(tempMeal);
        //print("added Meal");
      }

      Day tempDay = Day(weekday: weekday, date: date, meals: mealList);
      week.add(tempDay);
    }
    print("finished parsing ");

  } else {
    print("Error while loading data. Wrong response code");
  }
}
