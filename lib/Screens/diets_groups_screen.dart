import 'package:flutter/material.dart';

class DietsGroupsScreen extends StatelessWidget {
  const DietsGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar('Что вам нужно?'),
      body: Container(
        padding: EdgeInsets.only(top: 12, left: 16, right: 16),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.only(top: 12),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('assets/diet_image.png'),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(0.13)),
                  ],
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 35, top: 25, bottom: 25, right: 35),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Заболевания',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 92, 108, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          'диеты',
                          style: TextStyle(
                              color: Color.fromRGBO(129, 129, 129, 1),
                              fontSize: 14),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          'по заболеваниям',
                          style: TextStyle(
                              color: Color.fromRGBO(129, 129, 129, 1),
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                )

                // child: Container(
                //   margin:
                //       EdgeInsets.only(left: 35, top: 25, bottom: 25, right: 35),
                //   color: Colors.red.withOpacity(0.3),
                //   child: Text(
                //     'Заболевания',
                //     style: TextStyle(
                //         color: Color.fromRGBO(13, 92, 108, 1),
                //         fontWeight: FontWeight.bold,
                //         fontSize: 16),
                //   ),
                //
                // ),
                );
          },
        ),
      ),
    );
  }

  // Внешний вид Эпп Бара
  AppBar setAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
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
