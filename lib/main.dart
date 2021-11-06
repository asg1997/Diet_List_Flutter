import 'package:diet_list_flutter/Screens/diets_screen.dart';
import 'package:flutter/material.dart';
import 'package:diet_list_flutter/Screens/about_screen.dart';
import 'package:diet_list_flutter/Screens/bookmarks_screen.dart';
import 'package:diet_list_flutter/Screens/bottom_bar_screen.dart';
import 'package:diet_list_flutter/Screens/diets_groups_screen.dart';
import 'package:diet_list_flutter/Screens/info_screen.dart';
import 'package:diet_list_flutter/Screens/menu_screen.dart';
import 'package:diet_list_flutter/Screens/product_list_screen.dart';
import 'package:diet_list_flutter/Screens/recipe_screen.dart';
import 'package:diet_list_flutter/Screens/references_screen.dart';



void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Color.fromRGBO(48, 190, 190, 1),
  ),
  initialRoute: '/BottomBar',
  routes: {
    '/BottomBar': (context) => BottomBarScreen(),
    '/Diets': (context) => DietsScreen(),
    '/DietsGroups': (context) => DietsGroupsScreen(),
    '/About': (context) => AboutScreen(),
    '/ProductList': (context) => ProductListScreen(),
    '/Menu': (context) => MenuScreen(),
    '/Recipe': (context) => RecipeScreen(),
    '/Bookmarks': (context) => BookmarksScreen(),
    '/Info': (context) => InfoScreen(),
    '/References': (context) => ReferencesScreen(),
  },
));
