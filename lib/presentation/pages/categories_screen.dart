import 'package:flutter/material.dart';
import 'package:meals_app/data/dataSources/local/dummy_data.dart';
import 'package:meals_app/presentation/widgets/category_grid_item.dart';
import 'package:meals_app/utils/constants.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_BAR_TITLE),
      ),
      // GridView -> si vous n'avez pas beaucoup d'elt à afficher
      // GridView.builder -> et autres si vous avez many d'elt to show
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // deux colonnes
          childAspectRatio: 3 / 2, // taille des elt(grids)
          crossAxisSpacing: 20, // espacement horizontal colonnes
          mainAxisSpacing: 20, // espacement vertical colonnes
        ),
        children: [
          // ...availableCategories
          //     .map((category) => CategoryGridItem(category: category))
          //     .toList(),
          for (final category in availableCategories)
            CategoryGridItem(category: category),
        ],
      ),
    );
  }
}
