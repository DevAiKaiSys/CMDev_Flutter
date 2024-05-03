import 'package:flutter/cupertino.dart';

class Theme {
  const Theme();

  // Define start and end colors for the gradient
  static const Color gradientStart = Color(0xFF514a9d);
  static const Color gradientEnd = Color(0xFF24c6dc);

  // Create a linear gradient using the start and end colors
  static const LinearGradient _gradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );

  // Getter for the private gradient property
  static LinearGradient get gradient => _gradient;
}
