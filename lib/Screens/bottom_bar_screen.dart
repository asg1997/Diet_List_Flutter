import 'package:diet_list_flutter/Screens/bookmarks_screen.dart';
import 'package:diet_list_flutter/Screens/diets_groups_screen.dart';
import 'package:diet_list_flutter/Screens/info_screen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  int currentIndex = 0;

  final screens = [
    DietsGroupsScreen(),
    BookmarksScreen(),
    InfoScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: setBottomBar(),
      body: screens[currentIndex],

    );
  }

  BottomNavigationBar setBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromRGBO(48, 190, 190, 1),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: currentIndex,
      onTap: (index) => setState( () => currentIndex = index ),
      items: [
        setNavigationBarItem('Диеты', Icon(Icons.list)),
        setNavigationBarItem('Закладки', Icon(Icons.bookmark_border)),
        setNavigationBarItem('Информация', Icon(Icons.info_outline)),
      ],
    );
  }
  BottomNavigationBarItem setNavigationBarItem(String label, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
