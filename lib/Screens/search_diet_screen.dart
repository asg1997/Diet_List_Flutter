import 'package:flutter/material.dart';

class SearchDietScreen extends StatefulWidget {
  const SearchDietScreen({Key? key}) : super(key: key);

  @override
  _SearchDietScreenState createState() => _SearchDietScreenState();
}

class _SearchDietScreenState extends State<SearchDietScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/pribori.png')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ SizedBox(
                  height: 61,
                  width: 174,
                  child: ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/MainScreen');
                  },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 168, 0, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(210),
                        ),
                      ),
                      child: Text('Далее')),
                )
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/osnovnoi.png'),
                // растягиваем фото
                fit: BoxFit.fill)),
      ),
    );
  }
}
