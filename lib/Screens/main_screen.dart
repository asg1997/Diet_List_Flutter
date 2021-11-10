import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 23),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent
                      ),
                      child: Row(
                        children: [
                          Text('Гастрит',style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                        ),)
                        ],
                      )
                      /*Text('Гастрит', style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),)),
                  Icon(Icons.keyboard_arrow_down_rounded,
                  size: 25,
                  color: Color.fromRGBO(255, 168, 0, 1),)*/
                ]),
              ),

            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Icon(Icons.list, size: 30, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
