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

Color renderBackgroundColor(String currentState) {
  Color color;

  if (currentState == "FOCUS") {
    color = const Color.fromARGB(255, 239, 75, 75);
  } else if (currentState == "BREAK") {
    color = const Color.fromARGB(255, 145, 145, 144);
  } else {
    color = const Color.fromARGB(255, 242, 227, 201);
  }

  return color;
}

Color renderColor(String currentState) {
  Color color = Colors.white;
  if (currentState == "FOCUS" || currentState == "BREAK") {
    color = Colors.white;
  } else {
    color = Colors.black54;
  }

  return color;
}
