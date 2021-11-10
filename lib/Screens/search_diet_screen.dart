import 'package:flutter/material.dart';

class SearchDietScreen extends StatefulWidget {
  const SearchDietScreen({Key? key}) : super(key: key);

  @override
  _SearchDietScreenState createState() => _SearchDietScreenState();
}

class _SearchDietScreenState extends State<SearchDietScreen> {
  @override
  String _mySelection = 'Аритмия';
  List<String> dietsList = [
    'Аритмия',
    'Гастрит',
    'Панкреатит',
    'Язва',
    'Псориаз'
  ];

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
              addDropDownList(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 61,
                    width: 174,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/MainScreen');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 168, 0, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(210),
                          ),
                        ),
                        child: Text(
                          'Далее',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
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

  Widget addDropDownList(BuildContext context) {
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
              items: dietsList.map<DropdownMenuItem<String>>((String newValue) {
                return DropdownMenuItem<String>(
                  value: newValue,
                  child: Text(newValue),
                );
              }).toList(),
            ),
          )))
        ],
      ),
    );
  }
}
