import 'package:diet_list_flutter/Components/button.dart';
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
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(buttonTitle: 'Меню',
                      routeName: '/MenuScreen',),
                      Button(buttonTitle: 'Список продуктов',
                      routeName: '/ProductListScreen',)
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(padding: EdgeInsets.only( top: 20) ,
                      child: Text(
                      'Рекомендации',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      )
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  // TODO: - Реализовать нажатие
  Widget discriptionTile() {
    return GestureDetector( onTap: () {
      print('dgdfgdfgfd');
    },
      child: Container(
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
      ),
    );
  }
}
