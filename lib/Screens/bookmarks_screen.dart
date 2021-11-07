import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return cell(context);
      },
    ));
  }

  Container cell(BuildContext context) {
      return Container();
  }
}
