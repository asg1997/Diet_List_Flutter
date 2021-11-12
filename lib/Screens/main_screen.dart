import 'package:diet_list_flutter/Components/custom_app_bar.dart';
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
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create('Гастрит'),
      body: Stack(
        children: [
          // Картинка на заднем фоне
        Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/fon.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter)),
              ),
          // Основная информация
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10,
              left: 20,
              right: 20),
              child: Column(
                children: [
                  discriptionTile(),
                  SizedBox(height: 10),
                  discriptionTile(),
                ],
              ),
            ),
          ),

        ],

      ),
      // body: SafeArea(
      //   child: Stack(
      //     children: [
      //       // MARK: - Шапка
      //       // Задняя картинка
      //       Container(
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 image: AssetImage('assets/fon.png'),
      //                 fit: BoxFit.fitWidth,
      //                 alignment: Alignment.topCenter)),
      //       ),
      //       // Заголовок
      //       Align(
      //         alignment: Alignment.topCenter,
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 20),
      //           child:
      //               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //             ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                     primary: Colors.transparent,
      //                     shadowColor: Colors.transparent),
      //                 child: Row(children: [
      //                   Text(
      //                     'Гастрит',
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                   Padding(padding: EdgeInsets.only(left: 5)),
      //                   Icon(
      //                     Icons.keyboard_arrow_down_rounded,
      //                     size: 25,
      //                     color: Color.fromRGBO(255, 168, 0, 1),
      //                   )
      //                 ])),
      //           ]),
      //         ),
      //       ),
      //       // Меню
      //       Align(
      //           alignment: Alignment.topLeft,
      //           child: Padding(
      //               padding: const EdgeInsets.only(top: 19, left: 5),
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 style: ElevatedButton.styleFrom(
      //                     primary: Colors.transparent,
      //                     shadowColor: Colors.transparent),
      //                 child: Icon(
      //                   Icons.menu_outlined,
      //                   size: 30,
      //                   color: Colors.white,
      //                 ),
      //               ))),
      //
      //
      //       // Ячейки с описанием
      //       // SizedBox(height: 10,),
      //       // Column(
      //       // children: [
      //       //   discriptionTile(),
      //       //   SizedBox(height: 10),
      //       //   discriptionTile(),
      //       // ],
      //       // )
      //
      //     ],
      //   ),
      // ),
    );
  }



  // TODO: - Реализовать нажатие
  Widget discriptionTile() {
    return Container(
      height: 113,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Colors.black.withOpacity(0.13),
            spreadRadius: 10,
            blurRadius: 20,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Текст
          Expanded(
            // Левая часть ячейки
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 26, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Заголовок
                  Text(
                    'Описание диеты',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(13, 92, 108, 1)),
                  ),
                  // Расстояние между заголовком и описанием
                  SizedBox(height: 3,),
                  // Описание
                  Expanded(
                    child: Text(
                      'Performing hot reloadPerforming hot reloadPerforming hot reloadPerforming hot reloadreloadPerforming hot reloadreloadPerforming hot reload ',
                      style: TextStyle(
                        height: 1.7,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  // Растояние от описания до конца ячейки
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              // Ряд с иконкой
            ),
          ),

          // Правая часть: Иконка
          Padding(
            padding: const EdgeInsets.only(right: 17, top: 16, left: 16),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(Icons.touch_app_outlined,
                size: 25,
                color: Color.fromRGBO(255, 168, 0, 1),),
            ),
          )
        ],
      ),
    );
  }
}
