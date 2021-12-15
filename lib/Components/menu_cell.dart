import 'package:diet_list_flutter/Models/dish_model.dart';
import 'package:diet_list_flutter/Screens/recipe_screen.dart';
import 'package:diet_list_flutter/Service/firebase_storage_service.dart';
import 'package:diet_list_flutter/Service/image_service.dart';
import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:diet_list_flutter/helpers/project_fonts.dart';
import 'package:flutter/material.dart';

class MenuCell extends StatefulWidget {
  const MenuCell({Key? key, required this.dish}) : super(key: key);

  final Dish dish;

  @override
  _MenuCellState createState() => _MenuCellState();
}

class _MenuCellState extends State<MenuCell> {
  @override
  // Widget build(
  //   BuildContext context,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           builder: (context) => RecipeScreen(dish: widget.dish)));
  //     },
  //     child: Container(
  //       height: 120,
  //       width: 354,
  //       margin: EdgeInsets.only(top: 11),
  //       decoration: BoxDecoration(
  //         color: Colors.transparent,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Row(
  //         children: [
  //           FutureBuilder<String>(
  //               future: ImageService.getImage(path: widget.dish.imageLink),
  //               builder: (context, snapshot) {
  //                 final imageLink = snapshot.data;
  //                 switch (snapshot.connectionState) {
  //                   case ConnectionState.waiting:
  //                     return Container(
  //                       height: 120,
  //                       width: 120,
  //                       child: Center(
  //                         child: SizedBox(
  //                             height: 15,
  //                             width: 15,
  //                             child: CircularProgressIndicator(
  //                               color: ProjectColors.lightGrayText,
  //                             )),
  //                       ),
  //                     );
  //
  //                   case ConnectionState.done:
  //                     if (imageLink != null) {
  //                       return Container(
  //                         height: 120,
  //                         width: 120,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 offset: Offset.zero,
  //                                 color: Colors.black.withOpacity(0.15),
  //                                 blurRadius: 10,
  //                               )
  //                             ],
  //                             image: DecorationImage(
  //                                 image: NetworkImage(imageLink!),
  //                                 fit: BoxFit.cover)),
  //                       );
  //                     } else {
  //                       return Container(
  //                         height: 120,
  //                         width: 120,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 offset: Offset.zero,
  //                                 color: Colors.black.withOpacity(0.15),
  //                                 blurRadius: 10,
  //                               )
  //                             ],
  //                             image: DecorationImage(
  //                                 image: AssetImage('assets/fon.png'),
  //                                 fit: BoxFit.cover)),
  //                       );
  //                     }
  //
  //                   default:
  //                     return Container(
  //                       height: 120,
  //                       width: 120,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               offset: Offset.zero,
  //                               color: Colors.black.withOpacity(0.15),
  //                               blurRadius: 10,
  //                             )
  //                           ],
  //                           image: DecorationImage(
  //                               image: AssetImage('/assets/fon.png'),
  //                               fit: BoxFit.cover)),
  //                     );
  //                 }
  //               }),
  //           // текст ячейки
  //           Expanded(
  //               child: Padding(
  //             padding: const EdgeInsets.only(
  //                 top: 20, right: 7, left: 21, bottom: 20),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   widget.dish.name,
  //                   style: ProjectFonts.cellTitle,
  //                   maxLines: 2,
  //                 ),
  //                 Text(
  //                   transformArrayTiString(),
  //                   style: ProjectFonts.cellDescription,
  //                   maxLines: 2,
  //                 ),
  //               ],
  //             ),
  //           )),
  //           // иконка стрелка
  //           Icon(
  //             Icons.arrow_forward_ios_rounded,
  //             size: 13,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget build(
    BuildContext context,
  ) {
    return FutureBuilder<String>(
        future: ImageService.getImage(path: widget.dish.imageLink),
        builder: (context, snapshot) {
          final imageLink = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                height: 120,
                width: 120,
                child: Center(
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: ProjectColors.lightGrayText,
                      )),
                ),
              );

            case ConnectionState.done:
              if (imageLink != null) {
                final image = Image.network(imageLink);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RecipeScreen(dish: widget.dish, image: image,)
                    ));
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
                       
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset.zero,
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                )
                              ],
                              image: DecorationImage(
                                  image: image.image,
                                  fit: BoxFit.cover)),
                        ),

                        // текст ячейки
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 7, left: 21, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dish.name,
                                style: ProjectFonts.cellTitle,
                                maxLines: 2,
                              ),
                              Text(
                                transformArrayTiString(),
                                style: ProjectFonts.cellDescription,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        )),
                        // иконка стрелка
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 13,
                        )
                      ],
                    ),
                  ),
                );
              } else {
                final image = Image.asset('assets/defaultImage.png');
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => RecipeScreen(dish: widget.dish, image: image,)));
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
                        // TODO: - Вставить контейнер
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset.zero,
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                )
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/fon.png'),
                                  fit: BoxFit.cover)),
                        ),

                        // текст ячейки
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 7, left: 21, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dish.name,
                                style: ProjectFonts.cellTitle,
                                maxLines: 2,
                              ),
                              Text(
                                transformArrayTiString(),
                                style: ProjectFonts.cellDescription,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        )),
                        // иконка стрелка
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 13,
                        )
                      ],
                    ),
                  ),
                );
              }
            default:
              final image = Image.asset('assets/defaultImage.png');
              return GestureDetector(

                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RecipeScreen(dish: widget.dish, image: image)));
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
                      // TODO: - Вставить контейнер
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                              )
                            ],
                            image: DecorationImage(
                                image: AssetImage('/assets/fon.png'),
                                fit: BoxFit.cover)),
                      ),

                      // текст ячейки
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 7, left: 21, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dish.name,
                              style: ProjectFonts.cellTitle,
                              maxLines: 2,
                            ),
                            Text(
                              transformArrayTiString(),
                              style: ProjectFonts.cellDescription,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      )),
                      // иконка стрелка
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 13,
                      )
                    ],
                  ),
                ),
              );
          }
        });
  }

  String transformArrayTiString() {
    List<String> stringList = widget.dish.recipe.ingredients
        .map((e) => e.name.toLowerCase())
        .toList();
    return stringList.join(', ');
  }
}
