import 'package:flutter/material.dart';
import 'package:bmi_cal/color_container.dart';

class BMICard {
  ColorContainer _colorContainer = ColorContainer();

  Expanded expandedCardWidget({required List<Widget> contents, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        color: _colorContainer.cardColor, // 0xff272a4c
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: contents,
          ),
        ),
      ),
    );
  }
}
