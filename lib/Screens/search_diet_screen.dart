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
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Заболевание",
                        labelText: 'Выбрать заболевание',
                        labelStyle:
                        TextStyle(
                            fontSize: 24,
                            color: Colors.black),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    maxLines: 3,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Далее')),
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
