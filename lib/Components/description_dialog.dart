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
      child: UnconstrainedBox(
        child: Container(
          width: MediaQuery.of(context).size.width-100,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Text(widget.title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.description),
            ),
          ]),
        ),
      ),
    );
  }
}
