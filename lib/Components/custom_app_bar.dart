
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {


  AppBar create(String title) {
    return AppBar(
      centerTitle: true,
      title: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0),
      shadowColor: Colors.black.withOpacity(0),
    );
  }
}
//
// class CustomAppBar extends StatefulWidget {
//   CustomAppBar({Key? key,
//
//   this.hasDropdown = false,
//     this.hasMenu = false,
//     this.title = 'Гастрит'
//
//   }) : super(key: key);
//
//   bool hasMenu;
//   String title;
//   bool hasDropdown;
//
//
//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();
// }
//
// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(widget.title,
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//       backgroundColor: Colors.black.withOpacity(0),
//       shadowColor: Colors.black.withOpacity(0),
//     );
//   }
// }
