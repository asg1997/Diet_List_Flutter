import 'package:flutter/material.dart';

class DietsGroupsScreen extends StatelessWidget {
  const DietsGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: setAppBar('Что вам нужно?'));
  }

  // Внешний вид Эпп Бара
  AppBar setAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

