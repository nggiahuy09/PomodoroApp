import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

// in second and we need to convert it back to minute
List selectableTimes = [
  "0",
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300",
  "3600",
];

Color renderColor(String currentState) {
  Color color;

  if(currentState == "FOCUS") {
    color = Colors.redAccent;
  } else if(currentState == "BREAK") {
    color = Colors.lightBlueAccent;
  } else {
    color = Colors.green;
  }

  return color;
}