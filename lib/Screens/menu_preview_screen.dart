import 'dart:io';

import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/Components/menu_cell.dart';
import 'package:diet_list_flutter/Models/dish_model.dart';
import 'package:diet_list_flutter/Service/iap_service.dart';
import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPreviewScreen extends StatefulWidget {
  const MenuPreviewScreen({Key? key, required this.dishes}) : super(key: key);

  final List<Dish> dishes;

  @override
  _MenuPreviewScreenState createState() => _MenuPreviewScreenState();
}

class _MenuPreviewScreenState extends State<MenuPreviewScreen> {
  bool isLoading = false;
  int selectedIndex = 0;

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
          // Картинка
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fon.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
          ),
          SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: isLoading ? showIndicator() : showMenu()),
          )
        ],
      ),
    );
  }

  Widget showMenu() {
    if (Platform.isIOS) {
      return showIOSMenu();
    } else {
      return showAndroidMenu();
    }
  }

  Widget showIndicator() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (CircularProgressIndicator(
          color: ProjectColors.mainOrange,
        )),
        SizedBox(
          height: 20,
        ),
        Text(
          'Дождитесь окончания прогресса!',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }

  Widget showAndroidMenu() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuCell(
                      dish: widget.dishes[index],
                    );
                  })),
          buyButton(),
        ],
      ),
    );
  }

  Widget showIOSMenu() {
    Color buttonColor;
    if (selectedIndex ==0) {

    }
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){
                  setState(() {
                    selectedIndex = 0;
                  });
                }, child: Text('Завтрак', style: GoogleFonts.raleway(
                  fontSize: 16, fontWeight: FontWeight.bold, color: (selectedIndex == 0) ? ProjectColors.deepOrange : Colors.black
                ),)),
                TextButton(onPressed: (){
                  setState(() {
                    selectedIndex = 1;
                  });
                }, child: Text('Обед', style: GoogleFonts.raleway(
                    fontSize: 16, fontWeight: FontWeight.bold, color: (selectedIndex == 1) ? ProjectColors.deepOrange : Colors.black
                ),)),
                TextButton(onPressed: (){
                  setState(() {
                    selectedIndex = 2;
                  });
                }, child: Text('Ужин', style: GoogleFonts.raleway(
                    fontSize: 16, fontWeight: FontWeight.bold, color: (selectedIndex == 2) ? ProjectColors.deepOrange : Colors.black
                ),))
              ],
            ),
            height: 44,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuCell(
                      dish: widget.dishes[index],
                    );
                  })),
          buyButton(),
          SizedBox(
            height: 5,
          ),
          restoreButton()
        ],
      ),
    );
  }

  Widget buyButton() {
    return SizedBox(
      height: 61,
      width: 260,
      child: ElevatedButton(
          onPressed: () {
            buyTapped();
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

  Widget restoreButton() {
    return TextButton(
        onPressed: () {
          restoreTapped();
        },
        style: TextButton.styleFrom(
          primary: ProjectColors.mainOrange,
        ),
        child: Text(
          'Восстановить покупки',
          style: ProjectFonts.textButton,
          textAlign: TextAlign.center,
        ));
  }

  void buyTapped() async {
    // поменять shared prefs
    setState(() {
      isLoading = true;
    });
    final package = await IAPService.getPackage(productId: ProductId.menu_full);

    if (package != null) {
      await IAPService.purchase(package: package, entitlementId: 'menu');
      Navigator.pop(context);
    } else {
      // TODO: - Как-то обозначить, что покупка неудачная
      print('Не удается получить продукт menu_full');
    }
    setState(() {
      isLoading = false;
    });
  }

  void restoreTapped() async {
    // поменять shared prefs
    setState(() {
      isLoading = true;
    });

    final isRestoredSuccessfuly = await IAPService.isRestoredSuccessfuly();

    if (isRestoredSuccessfuly) {
      Navigator.pop(context);
    } else {
      // TODO: - Как-то обозначить, что покупка неудачная
      print('Не удается получить продукт menu_full');
    }
    setState(() {
      isLoading = false;
    });
  }
}
