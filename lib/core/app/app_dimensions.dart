import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  /// ✅ Screen dimensions
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  /// ✅ Get width as percentage
  static double widthPercentage(BuildContext context, double percentage) =>
      screenWidth(context) * percentage;

  /// ✅ Get height as percentage
  static double heightPercentage(BuildContext context, double percentage) =>
      screenHeight(context) * percentage;

  /// ✅ Padding & Margin (relative)
  static double smallPadding(BuildContext context) =>
      widthPercentage(context, 0.02); // ~2% of width

  static double mediumPadding(BuildContext context) =>
      widthPercentage(context, 0.04); // ~4% of width

  static double largePadding(BuildContext context) =>
      widthPercentage(context, 0.06); // ~6% of width

  /// ✅ Spacing (gap between widgets)
  static double smallSpacing(BuildContext context) =>
      heightPercentage(context, 0.01); // ~1% of height

  static double mediumSpacing(BuildContext context) =>
      heightPercentage(context, 0.02); // ~2% of height

  static double largeSpacing(BuildContext context) =>
      heightPercentage(context, 0.03); // ~3% of height

      

  /// ✅ Border Radius
  static double smallRadius(BuildContext context) =>
      widthPercentage(context, 0.02); // 2% of width

  static double mediumRadius(BuildContext context) =>
      widthPercentage(context, 0.04); // 4% of width

  static double largeRadius(BuildContext context) =>
      widthPercentage(context, 0.06); // 6% of width

  /// ✅ Logo / Image sizes
  static double logoWidth(BuildContext context) =>
      widthPercentage(context, 0.45); // 45% of screen width

  static double logoHeight(BuildContext context) =>
      heightPercentage(context, 0.15); // 15% of screen height

  /// ✅ Common widget widths
  static double textContainerWidth(BuildContext context) =>
      widthPercentage(context, 0.8); // 80% of screen width

  static double buttonWidth(BuildContext context) =>
      widthPercentage(context, 0.9); // 90% of screen width

  static double buttonHeight(BuildContext context) =>
      heightPercentage(context, 0.065); // 6.5% of screen height

  /// ✅ Generic SizedBox helpers
  static SizedBox sizedBoxWidth(BuildContext context, double percentage) =>
      SizedBox(width: widthPercentage(context, percentage));

  static SizedBox sizedBoxHeight(BuildContext context, double percentage) =>
      SizedBox(height: heightPercentage(context, percentage));
}
