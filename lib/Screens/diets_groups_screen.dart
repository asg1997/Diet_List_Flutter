import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:diet_list_flutter/Models/diets_groups.dart';
import 'diets_screen.dart';

class DietsGroupsScreen extends StatefulWidget {
  const DietsGroupsScreen({Key? key}) : super(key: key);

  @override
  _DietsGroupsScreenState createState() => _DietsGroupsScreenState();
}

class _DietsGroupsScreenState extends State<DietsGroupsScreen> {

  List dietGroups = [];

  @override
  void initState() {
    super.initState();

    dietGroups.addAll(
        [DietGroup('Заболевания',
            [Diet(
                'Аритмия',
                'жирное нельзя, '
                    'Лину можно',
                '3 раза в день',
                [Menu(
                    'zavtrak',
                    [Dish(
                        'zapekanka',
                        'image_1',
                        Recipe([
                          Ingredient(
                            'apple',
                            '100gr')
                        ],
                            'narezat')
                        )
                    ])
                ],
                [ProductList(''
                    'apple',
                    'permitted')
                ])
            ])
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar('Что вам нужно?'),
      body: Container(
        padding: EdgeInsets.only(top: 12, left: 16, right: 16),
        child: ListView.builder(
          itemCount: dietGroups.length,
          itemBuilder: (BuildContext context, int index) {
            return cell(context, dietGroups[index]);
          },
        ),
      ),
    );
  }

  SizedBox cell(BuildContext context, DietGroup dietGroup) {
    return SizedBox(
        height: 120,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 12),
                height: 120,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                      image: AssetImage('assets/diet_image.png'),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.13)),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 35, top: 25, bottom: 25, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dietGroup.dietGroupName,
                        style: const TextStyle(
                            color: Color.fromRGBO(13, 92, 108, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        'диеты',
                        style: TextStyle(
                            color: Color.fromRGBO(129, 129, 129, 1),
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'по заболеваниям',
                        style: TextStyle(
                            color: Color.fromRGBO(129, 129, 129, 1),
                            fontSize: 14),
                      )
                    ],
                  ),
                )),
            ListTile(
              onTap: () {
                transitionToDiets(context);
              },
            )
          ],
        )
    );
  }

  transitionToDiets(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DietsScreen()));
  }

// Внешний вид Эпп Бара
  AppBar setAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
