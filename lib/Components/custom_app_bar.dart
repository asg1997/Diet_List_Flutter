
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {

  AppBar create(String? title) {
    return AppBar(
      centerTitle: true,
      title: Text(title ?? '',
        style: ProjectFonts.navigationTitle
      ),
      backgroundColor: Colors.transparent.withOpacity(0),
      elevation: 0,
    );
  }
}

