import 'package:flutter/material.dart';

class AppColors {
  // Orange Primary Colors
  static const Color primaryOrange = Color(0xFFF97316);  // Main brand orange
  static const Color darkOrange = Color(0xFFEA580C);     // For pressed states
  static const Color lightOrange = Color(0xFFFDBA74);    // For highlights

  // Status Colors
  static const Color successGreen = Color(0xFF16A34A);
  static const Color errorRed = Color(0xFFDC2626);
  static const Color warningYellow = Color(0xFFFACC15);
  static const Color infoBlue = Color(0xFF2563EB);

  // Neutral Colors
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color mediumGray = Color(0xFFE5E5E5);
  static const Color darkGray = Color(0xFF404040);
  static const Color textBlack = Color(0xFF171717);

  // Dark Mode Colors
  static const Color darkBg = Color(0xFF0A0A0A);
  static const Color darkCard = Color(0xFF262626);
  static const Color darkText = Color(0xFFF5F5F5);
  static const Color darkOrangeAccent = Color(0xFFFF9E40);

  // Semantic Names for Specific Uses
  static const Color rideRequestButton = primaryOrange;
  static const Color cancelButton = errorRed;
  static const Color confirmButton = successGreen;
  static const Color driverMarker = Color(0xFF1E40AF);
  static const Color riderMarker = primaryOrange;
  static const Color routePolyline = Color(0xFF3B82F6);

  // Text Colors
  static const Color textPrimary = textBlack;
  static const Color textSecondary = darkGray;
  static const Color textOnOrange = pureWhite;
  static const Color textDisabled = mediumGray;

  // Background Colors
  static const Color scaffoldBackground = pureWhite;
  static const Color cardBackground = lightGray;
  static const Color inputFieldBackground = mediumGray;

  // Border Colors
  static const Color borderLight = mediumGray;
  static const Color borderDark = darkGray;
}

// Extension for easy theme access
extension AppColorsExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}