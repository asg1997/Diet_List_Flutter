import 'package:diet_list_flutter/Screens/main_screen.dart';
import 'package:diet_list_flutter/Screens/product_list_screen.dart';
import 'package:diet_list_flutter/Screens/search_diet_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/links_screen.dart';
import 'Screens/menu_screen.dart';
import 'Screens/recipe_screen.dart';
import 'Screens/web_view.dart';
import 'Service/firebase_storage_service.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color.fromRGBO(48, 190, 190, 1),
    ),
    initialRoute: '/SearchDietScreen',
    routes: {
      '/SearchDietScreen' : (context) => SearchDietScreen(),
      // '/MainScreen' : (context) => MainScreen(),
      '/MenuScreen' : (context) => MenuScreen(),
      '/ProductListScreen' : (context) => ProductListScreen(),
      '/RecipeScreen' : (context) => RecipeScreen(),
      '/LinksScreen' : (context) => LinksScreen(),
      '/WebViewScreen' : (context) => WebViewScreen(),


    },
  ));

}

