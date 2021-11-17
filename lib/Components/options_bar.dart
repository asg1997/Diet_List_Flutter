import 'dart:io';

import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class OptionsBar extends StatelessWidget {
  const OptionsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: checkPlatform(context)
    );
  }

  ListView checkPlatform(BuildContext context) {
    if (Platform.isIOS) {
      // iOS
      return ListView(
        children: [
          ListTile(
            title: Text(
                'Выбрать диету',style: ProjectFonts.text,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/SearchDietScreen');
            },
          ),
          ListTile(
            title: Text(
                'Оставить отзыв',style: ProjectFonts.text
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
                'Восстановить покупки',style: ProjectFonts.text
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
                'Ссылки на источники',style: ProjectFonts.text
            ),
            onTap: () {
              Navigator.pushNamed(context, '/LinksScreen');
            },
          )
        ],
      );
    } {
      // Android
      return ListView(
        children: [
          ListTile(
            title: Text(
                'Выбрать диету',style: ProjectFonts.text
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/SearchDietScreen');
            },
          ),
          ListTile(
            title: Text(
                'Оставить отзыв',style: ProjectFonts.text
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
                'Ссылки на источники',style: ProjectFonts.text
            ),
            onTap: () {
              Navigator.pushNamed(context, '/LinksScreen');
            },
          )
        ],
      );
    }
  }
}
