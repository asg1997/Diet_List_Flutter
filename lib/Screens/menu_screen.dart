import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/Components/menu_cell.dart';
import 'package:diet_list_flutter/Models/dish_model.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key, required this.dishes}) : super(key: key);

  final List<Dish> dishes;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

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
                            itemCount: widget.dishes.length,
                            itemBuilder: (BuildContext context, int index){
                              return MenuCell(dish: widget.dishes[index],);
                            }))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
