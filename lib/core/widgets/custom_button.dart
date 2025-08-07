import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, required this.text});
  final VoidCallback onPress; 
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
              width:360 ,
              height: 50,
              decoration: BoxDecoration(
                 color: AppColors.routePolyline,
                 borderRadius: BorderRadius.circular(20)
              ),
               child: TextButton(
                onPressed: (){
                  onPress();
                },
                  child: Text(text, style: TextStyles.semiBold16.copyWith(color: AppColors.pureWhite),),
                  
                   ),
             );
  }
}