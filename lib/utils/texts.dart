import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';

class AppTexts {

  static normalText(String text, int size){
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: size.toDouble(),
        fontWeight: FontWeight.normal,
        fontFamily:'Barlow'
      ),
    );
  }

  static boldText(String text, int size){
    return Text(
      text,
      style: TextStyle(
          color: AppColors.textColor,
          fontSize: size.toDouble(),
          fontWeight: FontWeight.bold,
          fontFamily:'Barlow',
      ),
    );
  }
}