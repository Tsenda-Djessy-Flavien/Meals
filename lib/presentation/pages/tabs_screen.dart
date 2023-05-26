import 'package:flutter/material.dart';
import 'package:meals_app/domain/models/meals_model.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/pages/filters_screen.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';
import 'package:meals_app/presentation/widgets/main_drawer.dart';
import 'package:meals_app/utils/constants.dart';

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
      _showInOfMessage(REMOVE_TO_FAVORITE);
      // print('remove ${meal.title}');
    } else {
      // isExisting = false
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInOfMessage(ADD_TO_FAVORITE);
      // print('add ${meal.title}');
    }
  }

  // quand on press sur le DrawerList,
  // on obtient une valeur differente à l'interieur de cette func
  void _setScreen(String idScreen) {
    if (idScreen == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FiltersScreen()),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
    );
    String activePageTitle = CATEGORY;

    if (_selectPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleMealFavoriteStatus: _toggleMealFavoriteStatus,
      );
      activePageTitle = FAVORITE;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
