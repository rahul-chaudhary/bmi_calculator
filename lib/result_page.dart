import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bmi_cal/color_container.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_cal/bmi_card.dart';
import 'package:bmi_cal/homepage.dart';

ColorContainer colorContainer = ColorContainer();
BMICard bmiCard = BMICard();
HomePage homePage = HomePage();

String _bmiMessage = 'message here';
Color _bmiCardTitleColor = colorContainer.accentColor;

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top]); //To enable fullscreen support
    return Scaffold(
      backgroundColor: colorContainer.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Expanded(
              flex: 13,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Result',
                  style: GoogleFonts.poppins(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            bmiCard.expandedCardWidget(
              contents: [
                Column(
                  children: [
                    Text(
                      bmiVerdictTitle(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: _bmiCardTitleColor,
                      ),
                    ),
                    Text(
                      calculateBMI().toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Normal BMI range:',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: colorContainer.secondaryTextColor,
                      ),
                    ),
                    Text(
                      '18.5 - 25kg/m²',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 85.0),
                    Text(
                      _bmiMessage,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50.0),
                  ],
                ),
              ],
              flex: 76,
            ),
            SizedBox(height: 25.0),
            Expanded(
              flex: 11,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: colorContainer.scaffoldBackgroundColor,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: colorContainer.scaffoldBackgroundColor,
                  backgroundColor: colorContainer.accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero), //😍
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double calculateBMI() {
  return homePage.getWeight() / pow(homePage.getHeight() * 0.01, 2);
  //BMI formula = weight(kg) / height^2(m);
  //converting height in cm toto m by multiplying it with 0.01 meters
}

String bmiVerdictTitle() {
  if (calculateBMI() < 18.5) {
    _bmiMessage = 'Eat you fucking stick';
    _bmiCardTitleColor = colorContainer.underWeightColor;
    return 'UNDERWEIGHT';
  } else if (calculateBMI() >= 18.5 && calculateBMI() <= 25) {
    _bmiMessage =
        'Only reason you\'ve normal bmi cause you don\'t have muscles lol';
    _bmiCardTitleColor = colorContainer.accentColor;
    return 'NORMAL';
  } else {
    _bmiMessage = 'Eat less u fatass';
    _bmiCardTitleColor = colorContainer.overWeightColor;
    return 'Overweight';
  }
}
