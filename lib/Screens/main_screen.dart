
import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/Components/description_dialog.dart';
import 'package:diet_list_flutter/Components/options_bar.dart';
import 'package:diet_list_flutter/Managers/alert_dialog.dart';
import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:diet_list_flutter/Models/dish_model.dart';
import 'package:diet_list_flutter/Models/product_model.dart';
import 'package:diet_list_flutter/Screens/menu_preview_screen.dart';
import 'package:diet_list_flutter/Screens/menu_screen.dart';
import 'package:diet_list_flutter/Screens/product_list_screen.dart';
import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(this.diet, {Key? key}) : super(key: key);
  final Future<Diet> diet;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => AlertManager().showAlert(context));

    return FutureBuilder<Diet>(
    future: widget.diet,
      builder: (context, snapshot) {
      final diet = snapshot.data;
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              color: Colors.white,
              ),
              CircularProgressIndicator(color: ProjectColors.mainOrange),
            ],
          );
        case ConnectionState.done:
          if (diet != null) {
            return screenWithData(diet);
          }  else {
            return Scaffold(body: Center(
                child: Text('Ошибка получения данных',
              style: TextStyle(color: Colors.black),)));
          }

        default:
          if (snapshot.error != null) {
            return Text('Ошибка во FB ${snapshot.error.toString()}');
          } else {
            return Text('Ошибка');
          }
      }
      },
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
                      title,
                      style: ProjectFonts.greenBoldTitle
                    ),
                    // Расстояние между заголовком и описанием
                    SizedBox(
                      height: 3,
                    ),
                    // Описание
                    Expanded(
                      child: Text(
                       description,
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

  Widget screenWithData(Diet diet) {
    return Scaffold(
      drawer: OptionsBar(),
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create(diet.name),
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
                      discriptionTile(title: 'Описание диеты', description: diet.description),
                      SizedBox(height: 10),
                      discriptionTile(title: 'Режим питания', description: diet.diet),
                      SizedBox(
                        height: 18,
                      ),
                      // Кнопки Меню и Список продуков
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // FIXME: - Кнопки не влезают, если экран уже (SE), нужно настраивать ширину кнопок для каикх-то устройств
                          Expanded(

                            child: menuButton(diet.dishes)
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: productListButton(diet.productList)
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
                      // TODO: - сделать рекомендации
                      // Container(
                      //     height: 300,
                      //     child: ListView.builder(
                      //         physics: NeverScrollableScrollPhysics(),
                      //         itemCount: 2,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return MenuCell(dish: widget.menu[0].dishes[index]);
                      //
                      //         }))
                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }



  Widget menuButton(List<Dish> dishes) {
    return SizedBox(
      height: 61,
      child: ElevatedButton(
          onPressed: () {
            menuTapped(context, dishes);
          },
          style: ElevatedButton.styleFrom(
            primary: ProjectColors.mainOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(210),
            ),
          ),
          child: Text(
            // Раньше прописывали текст кнопки здесь
            // Теперь этот текст будет браться из параметра
            // доступ к нему можно получить через ключевое слово widget
            'Рецепты',
            style: ProjectFonts.buttonText,
            textAlign: TextAlign.center,
          )),
    );
  }
  Widget productListButton(List<Product> productList) {
    return SizedBox(
      height: 61,
      child: ElevatedButton(
          onPressed: () {
            productListTapped(context, productList);
          },
          style: ElevatedButton.styleFrom(
            primary: ProjectColors.mainOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(210),
            ),
          ),
          child: Text(
            // Раньше прописывали текст кнопки здесь
            // Теперь этот текст будет браться из параметра
            // доступ к нему можно получить через ключевое слово widget
            'Список продуктов',
            style: ProjectFonts.buttonText,
            textAlign: TextAlign.center,
          )),
    );
  }

  void menuTapped(BuildContext context, List<Dish> dishes) {
    // TODO: - Логика с переходом на купленное некупленное меню
    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPreviewScreen(dishes: dishes)));
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(dishes: dishes)));
  }

  void productListTapped(BuildContext context, List<Product> productList ) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductListScreen(productList: productList)));
  }
}
