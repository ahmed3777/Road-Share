import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/widgets/custom_button.dart';
import 'package:roadshare/core/widgets/custom_login_text_field.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/features/auth/presentation/views/widgets/social_login.dart';
import 'package:roadshare/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[ 
           Center(
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
               SizedBox(
                   width: 170,
                   height: 130,
                 child: Image.asset(Assets.imagesSplash)),

                Text(S. of(context).ROADSHARE, style: TextStyles.semiBold16.copyWith(color: AppColors.routePolyline),),
                const  SizedBox(height: 20,),
                Text(S. of(context).create_your_account, style: TextStyles.semiBold20.copyWith(color: AppColors.darkBg),),
               const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: Text(S. of(context).Welcome_to_Roadshare, style: TextStyles.light12.copyWith(color: AppColors.darkBg),)),     
              ],
                       ),
           ),
           const  SizedBox(height: 20,),
             Text(S.of(context).Enter_Phone,style: TextStyles.semiBold11,),
             const SizedBox(height: 10,),
             CustomLoginTextField(),
             const SizedBox(height: 20,),
             CustomButton(),
             
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("OR", style: TextStyle(color: Colors.grey)),
                ),
                const Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                      ),
                          ],
                  ),
            const  SizedBox(height: 25,),
            SocialLogin( 
              onPressed: () {
                Navigator.pushNamed(context, LoginView.routeName);
              },
              text: S.of(context).Log_in,),
          ],
      ),
    );
  }
}
