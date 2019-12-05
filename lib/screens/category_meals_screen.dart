import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;
  // final Color color;

  // CategoryMealScreen(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final catTitle = routeArg['title'];
    final catId = routeArg['id'];
    final catColor = routeArg['color'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: categoryMeals[index].affordability,
              categories: categoryMeals[index].categories,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              ingredients: categoryMeals[index].ingredients,
              isGlutenFree: categoryMeals[index].isGlutenFree,
              isLactoseFree: categoryMeals[index].isLactoseFree,
              isVegan: categoryMeals[index].isVegan,
              isVegetarian: categoryMeals[index].isVegetarian,
              steps: categoryMeals[index].steps,
              title: categoryMeals[index].title,
            );
          },
          itemCount: categoryMeals.length,
        ),
        backgroundColor: catColor,
      ),
    );
  }
}
