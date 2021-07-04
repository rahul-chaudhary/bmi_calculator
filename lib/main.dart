import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_cal/homepage.dart';
import 'package:bmi_cal/color_container.dart';
import 'package:bmi_cal/result_page.dart';

void main() {
  ColorContainer colorContainer = ColorContainer();
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: colorContainer.primaryColor,
        scaffoldBackgroundColor: colorContainer.scaffoldBackgroundColor,
        accentColor: colorContainer.accentColor,
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: HomePage(),
          ),
        ),
      ),
    ),
  );
}
