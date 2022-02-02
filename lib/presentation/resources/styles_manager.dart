
import 'package:flutter/material.dart';

import './font_manager.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily, FontWeight fontWeight, Color color){
  return TextStyle(fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight
  );
}

// REGULAR
TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular,color);
}

// LIGHT
TextStyle getLightStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light,color);
}

// BOLD
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold,color);
}

// SEMI_BOLD
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold,color);
}

// MEDIUM
TextStyle getMediumStyle({double fontSize = FontSize.s12, required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium,color);
}
