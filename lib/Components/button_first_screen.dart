import 'package:diet_list_flutter/Components/button.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: - Сделать класс наследуемым от кнопки Button
class FirstScreenButton extends StatefulWidget {
  FirstScreenButton({
    Key? key,

    // дефолтные значения для кнопки, чтобы ничего не полетело
    this.buttonTitle = '',
    this.buttonColor = const Color.fromRGBO(255, 168, 0, 1),
    this.routeName = '/Main',
  }) : super(key: key);

// Параметры кнопки, которые будут меняться
  String buttonTitle;
  Color buttonColor;
  String routeName;

  void buttonTapped(BuildContext context) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  _FirstScreenButtonState createState() => _FirstScreenButtonState();

}

class _FirstScreenButtonState extends State<FirstScreenButton> {
  @override
  Widget build(BuildContext context) {
    return _buildButton();
  }

  Widget _buildButton() {
    return SizedBox(
      height: 61,
      child: ElevatedButton(
          onPressed: () {
            widget.buttonTapped(context);
          },
          style: ElevatedButton.styleFrom(
            primary: widget.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(210),
            ),
          ),
          child: Text(
            // Раньше прописывали текст кнопки здесь
            // Теперь этот текст будет браться из параметра
            // доступ к нему можно получить через ключевое слово widget
            widget.buttonTitle,
            style: ProjectFonts.buttonText,
            textAlign: TextAlign.center,
          )),
    );
  }


}