import 'package:flutter/material.dart';
import 'package:meals_app/utils/constants.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;

  _onSwitch(bool isChecked) {
    setState(() {
      _glutenFreeFilter = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(FILTERS_APP_BAR_TITLE),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilter,
            onChanged: _onSwitch,
            title: Text(
              SWITCH_TITLE_GLUTEN,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              SWITCH_SUBTITLE_GLUTEN,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
