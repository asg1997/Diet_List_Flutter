import 'package:diet_list_flutter/Components/menu_cell.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 9),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return MenuCell(
          );
        }
    );
  }
}
