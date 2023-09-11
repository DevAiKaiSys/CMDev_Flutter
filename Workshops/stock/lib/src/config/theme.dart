import 'package:flutter/material.dart';

class Theme {
  const Theme(); // ทุกตัวในนี้ต้องเป็นตัวแปรแบบสิ้นสุด (const)
  // ref https://uigradients.com/#Mantle
  static const Color gradientStart = Color(0xFF514a9d);
  static const Color gradientEnd = Color(0xFF24c6dc);

  static const gradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
