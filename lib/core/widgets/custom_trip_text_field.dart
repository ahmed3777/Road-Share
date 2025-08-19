import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';

class CustomTripTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTripTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, this.prefixIcon, this.suffixIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyles.regular14.copyWith(color: AppColors.darkBg, ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.light14.copyWith(color: AppColors.darkGray),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        fillColor: AppColors.lightGray,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      
    );
  }
}
