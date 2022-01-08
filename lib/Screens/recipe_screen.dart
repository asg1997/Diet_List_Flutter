import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';
import 'package:diet_list_flutter/Models/dish_model.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key, required this.dish, required this.image}) : super(key: key);

  final Image? image;
  final Dish dish;

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
            height: 260,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                image: DecorationImage(
                    image: widget.image!.image,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.dish.name,
                  style: ProjectFonts.boldTitle
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
                      itemCount: widget.dish.recipe.ingredients.length,
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
                                  Text(widget.dish.recipe.ingredients[index].name,
                                      style: ProjectFonts.tableText
                                  ),
                                  Text(widget.dish.recipe.ingredients[index].amount,
                                    style: ProjectFonts.tableSubtext,)
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
              style: ProjectFonts.boldTitle
            )
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget.dish.recipe.process,
                style: ProjectFonts.text
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
