import 'package:flutter/material.dart';

class MenuCell extends StatefulWidget {
  const MenuCell({Key? key}) : super(key: key);

  @override
  _MenuCellState createState() => _MenuCellState();
}

class _MenuCellState extends State<MenuCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/RecipeScreen');
      },
      child: Container(
        height: 120,
        width: 354,
        margin: EdgeInsets.only(top: 11),
        decoration: BoxDecoration(
        color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // картинка
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('assets/osnovnoi.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
            // текст ячейки
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 7, left: 21, bottom: 20),
                child: Column(
                  children: [
                    Text('Сырок глазированный Сырок глазированный Сырок глазированный ',
                      style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    /*SizedBox(height: 5,),*/
                    Text('Яйцо мука перец коктейль суфле манго апельсин',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.2,
                        color: Color.fromRGBO(129, 129, 129, 1)
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ),
            // иконка стрелка
            Icon(Icons.arrow_forward_ios_rounded,
            size: 13,)
          ],
        ),
      ),
    );
  }
}
