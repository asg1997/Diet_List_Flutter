import 'package:flutter/src/cupertino/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertWindow extends StatelessWidget {
  const AlertWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Обязательно к прочтению'),
      content: Text(
          'Нажимая на кнопку “Принять” , вы принимаете, что:\n\n- приложение носит ознакомительный хакартер\n\n- имеются противопоказанияn\n\n- для установления точной диеты обратитесь к специалисту\n\nПосмотреть ссылки на источники вы можете, перейдя в раздел меню "Ссылки на источники"',
      textAlign: TextAlign.left,),
      actions: [
        CupertinoDialogAction(
          child: Text('Принять'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}

class AlertManager {

  final keyIsFirstLoaded = 'keyIsFirstLoaded';

  showAlert(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      // Первая загрузка экрана
      // Показать диалог
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertWindow()
      );
      // обновить значения SP
      prefs.setBool(keyIsFirstLoaded, false);
    }

  }
// Ф-я, которая будет показывать диалог на первый заход

}
