import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}
// TODO: - Декомпозировать, чтобы работать со скроллом
class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create('') ,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 239,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/syroc.jpeg'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Омлет',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                )
            ),
            SizedBox(height: 10,),

            ConstrainedBox(constraints: BoxConstraints(
              minHeight: 150,
              maxHeight: 300
            ),
              // основной контейнер белый
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      color: Colors.black.withOpacity(0.13),
                      blurRadius: 20,
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index){
                        // настройка ячейки
                    return Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21, right: 21,),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ananas',style: TextStyle(
                                  ),
                                  ),
                                  Text('1 sht')
                                ],
                              ),
                            ),
                            Container(
                                height: 0.5,
                                color: Color.fromRGBO(205, 205, 205, 1),
                            )
                          ],
                        ),
                      )
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 39,),
            Align(
                alignment: Alignment.topLeft,
                child:
            Text('Способ приготовления',
              style: TextStyle(
                fontSize: 20,
              ),
            )
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '1. В глубокую мисочку вбейте яйца, добавьте щепотку соли (при желании также щепотку перца), влейте молоко. Взбейте венчиком или вилкой до однородности.'
                    '2. Жарьте его до готовности не бойтесь не пригорит ангелина я люблю тебя очень сильно иой одуванчЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебяЖарьте его до готовности не бойтесь не пригорит ангелина я люблю тебя',
                style: TextStyle(
                  fontSize: 16,
                  height: 2,
                  color: Color.fromRGBO(70, 70, 70, 1)
                ),
              ),
            )
          ],
            ),
          )
        ]),
      ),
    );
  }



}
