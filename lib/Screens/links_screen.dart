import 'package:diet_list_flutter/Components/button_links.dark.dart';
import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LinksScreen extends StatefulWidget {
  const LinksScreen({Key? key}) : super(key: key);

  @override
  _LinksScreenState createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create('Ссылки на источник'),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fon.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter
                )
            ),
          ),
          SafeArea(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('В глубокую мисочку вбейте яйца, добавьте щепотку соли (при желании также щепотку перца), влейте молоко. Взбейте венчиком или вилкой до однородности.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 2
                  ),
                  ),
                  SizedBox(height: 20),
                  ButtonLinks(buttonTitle: 'https://www.pinterest.ru/pin/36479163857',)
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}
