import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/Components/menu_cell.dart';
import 'package:diet_list_flutter/Models/dish_model.dart';
import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class MenuPreviewScreen extends StatefulWidget {
  const MenuPreviewScreen({Key? key, required this.dishes}) : super(key: key);

  final List<Dish> dishes;

  @override
  _MenuPreviewScreenState createState() => _MenuPreviewScreenState();
}

class _MenuPreviewScreenState extends State<MenuPreviewScreen> {

  @override
  initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create('Рецепты'),
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
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index){
                              return MenuCell(dish: widget.dishes[index],);
                            })),
                  menuButton()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuButton() {
    return SizedBox(
      height: 61,
      width: 260,
      child: ElevatedButton(
          onPressed: () {
            menuTapped();
          },
          style: ElevatedButton.styleFrom(
            primary: ProjectColors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(210),
            ),
          ),
          child: Text(
            // Раньше прописывали текст кнопки здесь
            // Теперь этот текст будет браться из параметра
            // доступ к нему можно получить через ключевое слово widget
            'Купить полное меню',
            style: ProjectFonts.buttonText,
            textAlign: TextAlign.center,
          )),
    );
  }

  void menuTapped() {
    // TODO: - Купить меню и перейти на другой экран
  }
}
