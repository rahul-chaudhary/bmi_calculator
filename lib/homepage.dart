import 'package:flutter/material.dart';
import 'package:bmi_cal/bmi_card.dart';
import 'package:bmi_cal/color_container.dart';

double _weightCurrentValue = 78;
double _heightCurrentValue = 178;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BMICard bmiCard = BMICard();
  ColorContainer colorContainer = ColorContainer();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 25.0),
        bmiCard.expandedCardWidget(
          contents: [
            Text(
              'WEIGHT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: colorContainer.secondaryTextColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_weightCurrentValue.toInt()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: colorContainer.primaryTextColor,
                  ),
                ),
                Text(
                  '  KG',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    // textBaseline: TextBaseline,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: colorContainer.primaryTextColor,
                  ),
                ),
              ],
            ),
            Slider(
              value: _weightCurrentValue,
              min: 10,
              max: 200,
              activeColor: colorContainer.accentColor,
              label: _weightCurrentValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weightCurrentValue = value;
                });
              },
            ),
          ],
          flex: 4,
        ),
        SizedBox(height: 25.0),
        bmiCard.expandedCardWidget(
          contents: [
            Text(
              'HEIGHT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: colorContainer.secondaryTextColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_heightCurrentValue.toInt()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: colorContainer.primaryTextColor,
                  ),
                ),
                Text(
                  '  cm',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    // textBaseline: TextBaseline,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: colorContainer.primaryTextColor,
                  ),
                ),
              ],
            ),
            Slider(
              value: _heightCurrentValue,
              min: 50,
              max: 250,
              activeColor: colorContainer.accentColor,
              label: _heightCurrentValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightCurrentValue = value;
                });
              },
            ),
          ],
          flex: 4,
        ),
        SizedBox(height: 25.0),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'CALCULATE',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: colorContainer.scaffoldBackgroundColor,
              ),
            ),
            style: TextButton.styleFrom(
                primary: colorContainer.scaffoldBackgroundColor,
                backgroundColor: colorContainer.accentColor),
          ),
        ),
      ],
    );
  }
}
