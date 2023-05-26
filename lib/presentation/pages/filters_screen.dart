import 'package:flutter/material.dart';
import 'package:meals_app/presentation/widgets/switch_button.dart';
// import 'package:meals_app/presentation/pages/tabs_screen.dart';
// import 'package:meals_app/presentation/widgets/main_drawer.dart';
import 'package:meals_app/utils/constants.dart';

// key des filters
enum Filter {
  gutenFree,
  lactoseFree,
  vegeterian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegeterianFilter = false;
  bool _veganFilter = false;

  // void _onSelectScreen(idScreen) {
  //   Navigator.of(context).pop();
  //   if (idScreen == 'meals') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const TabsScreen()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(FILTERS_APP_BAR_TITLE),
      ),
      // drawer: MainDrawer(onSelectScreen: _onSelectScreen),
      body: WillPopScope(
        onWillPop: () async {
          // navigation en arrière
          Navigator.of(context).pop({
            Filter.gutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegeterian: _vegeterianFilter,
            Filter.vegan: _veganFilter,
          });
          // et coe nous navigons en arrière on doit ici return false
          return false; // true si on renvoyais ces données dans une database
        },
        child: Column(
          children: [
            SwitchButton(
              value: _glutenFreeFilter,
              onChanged: (bool isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
              title: SWITCH_TITLE_GLUTEN,
              subtitle: SWITCH_SUBTITLE_GLUTEN,
            ),
            SwitchButton(
              value: _lactoseFreeFilter,
              onChanged: (bool isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: SWITCH_TITLE_LACTOSE,
              subtitle: SWITCH_SUBTITLE_LACTOSE,
            ),
            SwitchButton(
              value: _vegeterianFilter,
              onChanged: (bool isChecked) {
                setState(() {
                  _vegeterianFilter = isChecked;
                });
              },
              title: SWITCH_TITLE_VEGTARIAN,
              subtitle: SWITCH_SUBTITLE_VEGTARIAN,
            ),
            SwitchButton(
              value: _veganFilter,
              onChanged: (bool isChecked) {
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              title: SWITCH_TITLE_VEGAN,
              subtitle: SWITCH_SUBTITLE_VEGAN,
            ),
          ],
        ),
      ),
    );
  }
}
