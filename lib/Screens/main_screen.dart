import 'package:diet_list_flutter/Components/button.dart';
import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/Components/custom_list.dart';
import 'package:diet_list_flutter/Components/description_dialog.dart';
import 'package:diet_list_flutter/Components/menu_cell.dart';
import 'package:diet_list_flutter/Components/options_bar.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> list = ['sdffsd', 'sdfsaab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OptionsBar(),
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, left: 20, right: 20),
                child: Column(
                  children: [
                    discriptionTile(title: 'Описание диеты', description: 'PereloadPerforming hot reloadreloadPerforming hot reload '),
                    SizedBox(height: 10),
                    discriptionTile(title: 'Режим питания', description: 'чтобы покушать надо приготовить вкусную еду а готовить всегда лень поэтому легче заказать ага ага а любимая жена не хочет ну и ладно у меня то чебуреки есть а у нее нит'),
                    SizedBox(
                      height: 18,
                    ),
                    // Кнопки Меню и Список продуков
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // FIXME: - Кнопки не влезают, если экран уже (SE), нужно настраивать ширину кнопок для каикх-то устройств
                        Expanded(
                          child: Button(
                            buttonTitle: 'Меню',
                            routeName: '/MenuScreen',
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Button(
                            buttonTitle: 'Список продуктов',
                            routeName: '/ProductListScreen',
                          ),
                        )
                      ],
                    ),
                    // Рекомендации надпись
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Рекомендации',
                            style: ProjectFonts.boldTitle
                          )),
                    ),
                    // Таблица
                    Container(
                      height: 300,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return MenuCell();

                            }))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget discriptionTile({required String title, required String description}) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => DescriptionDialog(
              title: title,
            description: description,)
        );

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
                  children:  [
                    // Заголовок
                    Text(
                      'Описание диеты',
                      style: ProjectFonts.greenBoldTitle
                    ),
                    // Расстояние между заголовком и описанием
                    SizedBox(
                      height: 3,
                    ),
                    // Описание
                    Expanded(
                      child: Text(
                        'Performing hot reloadPerforming hot reloadPerforming hot reloadPerforming hot reloadreloadPerforming hot reloadreloadPerforming hot reload ',
                        style: ProjectFonts.lightGreyText,
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
                child: Icon(
                  Icons.touch_app_outlined,
                  size: 25,
                  color: Color.fromRGBO(255, 168, 0, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
