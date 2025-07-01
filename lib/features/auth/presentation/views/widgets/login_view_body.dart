import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: AppDimensions.screenWidth(context),
      height: AppDimensions.screenHeight(context),
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  width: 170,
                  height: 150,
                child: Image.asset(Assets.imagesSplash)),
            ),
              Text(S. of(context).ROADSHARE, style: TextStyles.semiBold16.copyWith(color: AppColors.routePolyline),),
              Text(S. of(context).Log_into_your_account, style: TextStyles.semiBold20.copyWith(color: AppColors.darkBg),),
              SizedBox(height: 15,),
              SizedBox(
                width: 300,
                child: Text(S. of(context).Welcome_to_Roadshare, style: TextStyles.light12.copyWith(color: AppColors.darkBg),)),     
            ],
          ),

          Text(S.of(context).Enter_Phone,style: TextStyles.semiBold11,),

        ]
      ),
    );
  }
}