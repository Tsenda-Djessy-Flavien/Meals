import 'package:flutter/material.dart';
import 'package:meals_app/configs/congifs.dart';
import 'package:meals_app/data/dataSources/local/dummy_data.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';
import 'package:meals_app/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: theme,
      home: MealsScreen(title: 'Some Category...', meals: dummyMeals),
      // home: const CategoriesScreen(),
    );
  }
}
