import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 100,
            width: 300,
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).secondaryHeaderColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}