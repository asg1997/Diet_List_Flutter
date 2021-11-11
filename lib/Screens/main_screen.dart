import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  // TODO: - Добавить переменную типа Диета, название и данные оттуда будут

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> list = ['sdffsd', 'sdfsaab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/fon.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
            ),
            // Заголовок
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Row(children: [
                        Text(
                          'Гастрит',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 25,
                          color: Color.fromRGBO(255, 168, 0, 1),
                        )
                      ])),
                ]),
              ),
            ),
            // Меню
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 19, left: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Icon(
                        Icons.menu_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ))),
            // Ячейки с описанием диет
            descriptionPanel()
          ],
        ),
      ),
    );
  }

  // Widget descriptionPanel() {
  //   return Container(
  //     child: ListView.builder(
  //
  //         itemCount: list.length,
  //         padding: EdgeInsets.only(top: 70, left: 24, right: 24),
  //         itemBuilder: (context, index) => DecoratedBox(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: ExpansionTile(
  //                 title: Text(
  //                   'Описание диеты',
  //                   style: TextStyle(
  //                       fontSize: 15,
  //                       fontWeight: FontWeight.bold,
  //                       color: Color.fromRGBO(13, 92, 108, 1)),
  //                 ),
  //                 children: list
  //                     .map((value) => DecoratedBox(
  //                           decoration: BoxDecoration(color: Colors.white),
  //                           child: ListTile(
  //                             title: Text(value),
  //                           ),
  //                         ))
  //                     .toList(),
  //               ),
  //             )),
  //   );
  // }

  Widget descriptionPanel() {
    return Column(
      children: [
          Container(
            height: 113,
            padding: EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
          )
      ],
    );
  }
}
