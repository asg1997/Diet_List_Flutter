import 'package:diet_list_flutter/Components/button_links.dark.dart';
import 'package:diet_list_flutter/Components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LinksScreen extends StatefulWidget {
  const LinksScreen({Key? key}) : super(key: key);



  @override
  _LinksScreenState createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar().create('Ссылки на источник'),
      body: Stack(
        children: [
          addImage(),
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
              padding: EdgeInsets.only(top: 20, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('Приложение "Твой диетолог" носит ознакомительный характер. Имеются противопоказания. Для установления точной диеты обратитесь к специалисту.\n\nСсылки на источники информации:',
                  style: TextStyle(
                    fontSize: 16,
                    height: 2
                  ),
                  ),
                  SizedBox(height: 20),
                  ButtonLinks(buttonTitle: 'https://edaplus.info/feeding-in-sickness.html',),
                  ButtonLinks(buttonTitle: 'https://miin.ru/blog/lechebnye-diety/',),
                  ButtonLinks(buttonTitle: 'https://cmd74.ru/lechebnye-stoly-diety/',),
                  ButtonLinks(buttonTitle: 'https://medongroup-spb.ru/company/articles/diety-pri-razlichnykh-zabolevaniyakh/',),
                  ButtonLinks(buttonTitle: 'https://doktorstolet.ru/articles/terapiya/lechebnye-diety/',),
                  ButtonLinks(buttonTitle: 'https://azbyka.ru/recept/lechebnye-stoly-diety-1-15-po-pevzneru-tablicy-produktov-i-rezhim-pitanija/',)
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }

  Widget addImage() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fon.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter
          )
      ),
    );
  }
}
