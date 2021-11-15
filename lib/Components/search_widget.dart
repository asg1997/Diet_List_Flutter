import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {

  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;


  const SearchWidget({
    Key? key,
    required this.text,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint:styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),

      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          // Иконка поиска
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty ?
              GestureDetector(
                // Иконка удалить текст
                child: Icon(Icons.close, color: Colors.grey, size: 18,),
                onTap: () {
                controller.clear();
                widget.onChanged('');
                FocusScope.of(context).requestFocus(FocusNode());
                },
              )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

