import 'package:diet_list_flutter/helpers/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectFonts {
  static TextStyle navigationTitle = GoogleFonts.raleway(
      fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle greenBoldTitle = GoogleFonts.raleway(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ProjectColors.darkGreenText,
  );

  static TextStyle lightGreyText = GoogleFonts.raleway(
      fontSize: 14, height: 1.7, color: ProjectColors.lightGrayText);

  static TextStyle boldTitle = GoogleFonts.raleway(
      fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600);

  static TextStyle cellTitle = GoogleFonts.raleway(
      fontSize: 18,
      height: 1.2,
      color: Colors.black,
      fontWeight: FontWeight.w600);

  static TextStyle cellDescription = GoogleFonts.raleway(
      fontSize: 14, height: 1.3, color: ProjectColors.lightGrayText);

  static TextStyle text = GoogleFonts.raleway(
      fontSize: 18,
      height: 2.0,
      color: Color.fromRGBO(70, 70, 70, 1),
      fontWeight: FontWeight.w500);

  static TextStyle tableText = GoogleFonts.raleway(
      fontSize: 16,
      color: Color.fromRGBO(54, 54, 54, 1),
      fontWeight: FontWeight.w500);

  static TextStyle tableSubtext = GoogleFonts.raleway(
      fontSize: 16,
      color: Color.fromRGBO(174, 174, 174, 1),
      fontWeight: FontWeight.w500);

  static TextStyle buttonText = GoogleFonts.raleway(
      fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle textButton = GoogleFonts.raleway(
      fontSize: 14,
      color: ProjectColors.mainOrange,
      fontWeight: FontWeight.bold);

  static TextStyle searchText =
      GoogleFonts.raleway(fontSize: 16, color: ProjectColors.lightGrayText);
}
