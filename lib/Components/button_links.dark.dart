import 'package:diet_list_flutter/Screens/web_view.dart';
import 'package:flutter/material.dart';

class ButtonLinks extends StatefulWidget {

   ButtonLinks({Key? key,

    this.buttonTitle = ''

  }) : super(key: key);

  // Параметры кнопки, которые будут меняться
  String buttonTitle;

  @override
  _ButtonLinksState createState() => _ButtonLinksState();
}

class _ButtonLinksState extends State<ButtonLinks> {
  @override
  Widget build(BuildContext context) {
    return _buildButtonLinks();
  }

  Widget _buildButtonLinks() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(link: widget.buttonTitle,)));
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero
      ),
      child: Text(
      widget.buttonTitle,
      style: TextStyle(
        fontSize: 16,
        color: Colors.blue,
      ),
      maxLines: 1,
      ),
    );
  }
}
