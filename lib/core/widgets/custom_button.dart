import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

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
                onPressed: (){},
                  child: Text(S.of(context).Continue, style: TextStyles.semiBold16.copyWith(color: AppColors.pureWhite),),
                  
                   ),
             );
  }
}