import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionDialog extends StatefulWidget {
  DescriptionDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  _DescriptionDialogState createState() => _DescriptionDialogState();
}

class _DescriptionDialogState extends State<DescriptionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Flex(
        // TODO: Контейнер меняется в зависимости от высоты
        direction: Axis.vertical,
        children: [Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset.zero,
                color: Colors.black.withOpacity(0.3),
                blurRadius: 30,
              )
            ],
          ),
          child: Column(children: [
            Text(widget.title),
            Text(widget.description),
          ]),
        ),]
      ),
    );
  }
}
