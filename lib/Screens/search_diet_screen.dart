import 'package:diet_list_flutter/Components/button_first_screen.dart';
import 'package:diet_list_flutter/Models/diet_model.dart';
import 'package:diet_list_flutter/Service/diet_list_service.dart';
import 'package:diet_list_flutter/Service/diet_service.dart';
import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SearchDietScreen extends StatefulWidget {
  const SearchDietScreen({Key? key}) : super(key: key);

  @override
  _SearchDietScreenState createState() => _SearchDietScreenState();
}

class _SearchDietScreenState extends State<SearchDietScreen> {
  @override
  initState() {
    super.initState();
    dietsList = DietListService.getDietsList();
  }

  String _mySelection = 'Аритмия';
  Future<List<String>>? dietsList;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: FutureBuilder<List<String>>(
          future: dietsList,
          builder: (context, snapshot) {
            final dietsList = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator(
                  color: Colors.white,
                );

              case ConnectionState.done:
                if (dietsList != null) {
                  return screenWithData(dietsList);
                } else {
                  return screenWithData([]);
                }
              default:
                return Text('Ошибка. Повторите позже');
            }
          },
        )),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/osnovnoi.png'),
                // растягиваем фото
                fit: BoxFit.fill)),
      ),
    );
  }

  Widget screenWithData(List<String> dietList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/pribori.png')],
        ),
        addDropDownList(context, dietList),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Для того. чтобы получить кнопку, нужно просто написать ее класс
            // Можно не менять параментры кнопки, тогда они будет без текста
            // можно вызвать параметры в скобках и изменить текст или цвет или и то, и другое
            SizedBox(width: 150, child: button()),
          ],
        )
      ],
    );
  }

  Widget button() {
    return SizedBox(
      height: 61,
      child: ElevatedButton(
          onPressed: () {
            buttonTapped(context, diet_name: _mySelection);
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
            'Далее',
            style: ProjectFonts.buttonText,
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget addDropDownList(BuildContext context, List<String> dietList) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: _mySelection,
              onChanged: (String? newValue) {
                setState(() {
                  _mySelection = newValue!;
                });
              },
              items: dietList.map<DropdownMenuItem<String>>((String newValue) {
                return DropdownMenuItem<String>(
                  value: newValue,
                  child: Text(
                    newValue,
                    style: ProjectFonts.tableText,
                  ),
                );
              }).toList(),
            ),
          )))
        ],
      ),
    );
  }

  void buttonTapped(BuildContext context, {required String diet_name}) {
    // TODO: - Передать данные на след экран
    // Получить диету
    final Future<Diet> diet = DietService.getDiet(named: diet_name);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MainScreen(diet)),
    );
  }
}
