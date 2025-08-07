import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/app/custom_progress_ind.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/utils/constants.dart';
import 'package:roadshare/core/widgets/custom_button.dart';
import 'package:roadshare/core/widgets/custom_login_text_field.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_cubit.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_state.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/features/auth/presentation/views/otp_view.dart';
import 'package:roadshare/features/auth/presentation/views/widgets/social_login.dart';
import 'package:roadshare/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is PhoneAuthError) {
          Navigator.of(context).pop(); // Dismiss loading indicator
          showErrorBar(context, state.message);
        } else if (state is PhoneAuthCodeSent) {
          Navigator.of(context).pop(); // Dismiss loading indicator
          Navigator.pushReplacementNamed(
            context,
            OtpView.routeName,
            arguments: {
              Constants.kVerificationId: state.verificationId,
              Constants.kPhoneNumber: phoneController.text.trim(),
            },
          );
        } 
      },
      builder: (context, state) {
        return state is PhoneAuthLoading?
          CustomProgressInd():
          Padding(
          padding: EdgeInsets.all(AppDimensions.mediumPadding(context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensions.logoWidth(context),
                        height: AppDimensions.logoHeight(context),
                        child: Image.asset(Assets.imagesSplash),
                      ),
                      SizedBox(height: AppDimensions.mediumSpacing(context)),
                      Text(
                        S.of(context).ROADSHARE,
                        style: TextStyles.semiBold16.copyWith(
                          color: AppColors.routePolyline,
                        ),
                      ),
                      SizedBox(height: AppDimensions.mediumSpacing(context)),
                      Text(
                        S.of(context).create_your_account,
                        style: TextStyles.semiBold20.copyWith(
                          color: AppColors.darkBg,
                        ),
                      ),
                      SizedBox(height: AppDimensions.smallSpacing(context)),
                      SizedBox(
                        width: AppDimensions.textContainerWidth(context),
                        child: Text(
                          S.of(context).Welcome_to_Roadshare,
                          style: TextStyles.light12.copyWith(
                            color: AppColors.darkBg,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimensions.largeSpacing(context)),
                Text(S.of(context).Enter_Phone, style: TextStyles.semiBold11),
                SizedBox(height: AppDimensions.smallSpacing(context)),
                CustomLoginTextField(phoneController: phoneController),
                SizedBox(height: AppDimensions.mediumSpacing(context)),
                CustomButton(

                  text: S.of(context).Continue,
                  onPress: () {
                    final phoneNumber = phoneController.text.trim();
                    if (phoneNumber.isNotEmpty) {
                      context
                          .read<SignInCubit>()
                          .verifyPhoneNumber(phoneNumber);
                    } else {
                      showErrorBar(context, "Please enter a phone number.");
                    }
                  },
                ),
                SizedBox(height: AppDimensions.mediumSpacing(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Divider(thickness: 1, color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.smallPadding(context),
                      ),
                      child: Text(
                        S.of(context).or,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Expanded(
                      child: Divider(thickness: 1, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.largeSpacing(context)),
                SocialLogin(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                  text: S.of(context).Log_in,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
