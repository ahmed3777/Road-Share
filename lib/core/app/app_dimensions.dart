import 'package:flutter/material.dart';
class AppDimensions {
  // Ensure this class cannot be instantiated
  AppDimensions._();

  // Device Dimensions
  static double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
  static double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

  // Common Margins
  static const double smallMargin = 8.0;
  static const double mediumMargin = 16.0;
  static const double largeMargin = 24.0;
  static const double extraLargeMargin = 32.0;

  // Common Paddings
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  // Common Spacing (Gaps between widgets)
  static const double smallSpacing = 4.0;
  static const double mediumSpacing = 12.0;
  static const double largeSpacing = 20.0;

  // Border Radius
  static const double smallRadius = 8.0;
  static const double mediumRadius = 16.0;
  static const double largeRadius = 24.0;
  static const double extraLargeRadius = 50.0;

  // Custom percentages of screen size
  /// Returns a value that is a given percentage of the screen width.
  ///
  /// [percentage] should be a value between 0.0 and 1.0, where 0.0 is 0% and 1.0 is 100%.
  ///
  /// For example, to get a value that is 25% of the screen width, you would call:
  ///
  /// `widthPercentage(context, 0.25)`.
  static double widthPercentage(BuildContext context, double percentage) =>  screenWidth(context) * percentage;
  static double heightPercentage(BuildContext context, double percentage) => screenHeight(context) * percentage;
}
