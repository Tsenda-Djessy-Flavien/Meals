import 'package:flutter/material.dart';
import 'package:meals_app/domain/models/meals_model.dart';
import 'package:meals_app/utils/constants.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<MealsModel> meals;

  @override
  Widget build(BuildContext context) {
    Widget contentMeals = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            NOTHING_FOUND,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          Text(
            CHOOSE_CATEGORY,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      contentMeals = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => Text(meals[index].title),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: contentMeals,
    );
  }
}
