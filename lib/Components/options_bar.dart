import 'package:diet_list_flutter/helpers/colors_extension.dart';
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
    if (TargetPlatform.iOS == true) {
      // iOS
      return ListView(
        children: [
          ListTile(
            title: Text(
                'Выбрать диету'
            ),
            leading: Icon(Icons.playlist_add_check_outlined,
              color: ProjectColors.deepOrange,),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/SearchDietScreen');
            },
          ),
          ListTile(
            title: Text(
                'Оставить отзыв'
            ),
            leading: Icon(Icons.rate_review_outlined,
              color: ProjectColors.deepOrange,),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
                'Восстановить покупки'
            ),
            leading: Icon(Icons.monetization_on_outlined,
              color: ProjectColors.deepOrange,),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
                'Ссылки на источники'
            ),
            leading: Icon(Icons.link,
              color: ProjectColors.deepOrange,),
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
                'Выбрать диету'
            ),
            leading: Icon(Icons.playlist_add_check_outlined,
              color: ProjectColors.deepOrange,),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/SearchDietScreen');
            },
          ),
          ListTile(
            title: Text(
                'Оставить отзыв'
            ),
            leading: Icon(Icons.rate_review_outlined,
              color: ProjectColors.deepOrange,),
            onTap: () {

            },
          ),
          ListTile(
            title: Text(
                'Ссылки на источники'
            ),
            leading: Icon(Icons.link,
              color: ProjectColors.deepOrange,),
            onTap: () {
              Navigator.pushNamed(context, '/LinksScreen');
            },
          )
        ],
      );
    }
  }
}
