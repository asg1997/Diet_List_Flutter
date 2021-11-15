import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button({
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

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return _buildButton();
  }

  Widget _buildButton() {
    return SizedBox(
      height: 61,
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, widget.routeName);
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
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
