import 'package:diet_list_flutter/Screens/search_diet_screen.dart';
import 'package:diet_list_flutter/Service/iap_service.dart';
import 'package:flutter/material.dart';
import 'Screens/links_screen.dart';
import 'Screens/web_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _initPlatformState();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(48, 190, 190, 1),
    ),
    initialRoute: '/SearchDietScreen',
    routes: {
      '/SearchDietScreen': (context) => SearchDietScreen(),
      '/LinksScreen': (context) => LinksScreen(),
      '/WebViewScreen': (context) => WebViewScreen(),
    },
  ));
}

Future<void> _initPlatformState() async {
  await Purchases.setDebugLogsEnabled(true);
  await Purchases.setup("appl_GLUiphfhULczkIrpYcPsiqjrdsv");
}
