import 'package:flutter/material.dart';
import 'package:meals_app/domain/models/meals_model.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<MealsModel> _favoriteMeals = [];

  void _selectPage(newIndex) {
    setState(() {
      _selectPageIndex = newIndex;
    });
  }

  void _showInOfMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(MealsModel meal) {
    // verifie si cela existe deja dans la liste ou pas
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      // isExisting = true
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInOfMessage('Meal is no longer a favorite');
      // print('remove ${meal.title}');
    } else {
      // isExisting = false
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInOfMessage('Marked as a favorite');
      // print('add ${meal.title}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
    );
    String activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
