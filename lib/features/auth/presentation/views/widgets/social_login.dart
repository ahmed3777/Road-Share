import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_cubit.dart';
import 'package:roadshare/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:roadshare/generated/l10n.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key, required this.text, required this.onPressed});

  final String text;  
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
            onPressed: () {
              context.read<SignInCubit>().signInWithGoogle();
            }, text: S.of(context).continue_with_google, iconPath: Assets.imagesIconsGoogle,),
        SizedBox(
          height: 16.w,
        ),
        SocialButton(
            text: S.of(context).continue_with_apple,
            iconPath: Assets.imagesIconApple,
            onPressed: () {
              // context.read<SignUpCubit>().signinWithFacebook();
              // if (context.read<SignUpCubit>().state is SignUpLoading) {
              //   const CircularProgressIndicator();
              // }
            }),
        const SizedBox(
          height: 22,
        ),
            // Sign up text
        RichText(
          text: TextSpan(
            text: S.of(context).DontHaveAnAccount,
            style: TextStyles.bold16.copyWith(color: AppColors.darkBg),
            children: [
              TextSpan(
                text: text,
                style: TextStyles.semiBold16.copyWith(color: AppColors.infoBlue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onPressed();
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
