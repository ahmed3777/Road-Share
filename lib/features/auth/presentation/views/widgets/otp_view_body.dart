import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/widgets/custom_button.dart';
import 'package:roadshare/features/auth/presentation/cubit/cubit/sign_in_cubit.dart';
import 'package:roadshare/features/home/presentation/home_view.dart';
import 'package:roadshare/generated/l10n.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  late TextEditingController otp1;
  late TextEditingController otp2;
  late TextEditingController otp3;
  late TextEditingController otp4;
  late TextEditingController otp5;
  late TextEditingController otp6;

  @override
  void initState() {
    otp1 = TextEditingController();
    otp2 = TextEditingController();
    otp3 = TextEditingController();
    otp4 = TextEditingController();
    otp5 = TextEditingController();
    otp6 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    otp5.dispose();
    otp6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verificationId = widget.verificationId;

    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is PhoneAuthError) {
          showErrorBar(context, state.message);
        } 
        else if (state is PhoneAuthLoading) {
          CircularProgressIndicator(
            color: AppColors.routePolyline,
          );
        }
        
       else if (state is PhoneAuthLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } 
      },
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.mediumPadding(context)),
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
                    S.of(context).SMS_Code,
                    style: TextStyles.semiBold20.copyWith(
                      color: AppColors.darkBg,
                    ),
                  ),
                  SizedBox(height: AppDimensions.smallSpacing(context)),
                  SizedBox(
                    width: AppDimensions.textContainerWidth(context),
                    child: Text(
                      "Enter 4 digit code which was sent to +49 123 456 7890",
                      style: TextStyles.light12.copyWith(
                        color: AppColors.darkBg,
                      ),
                    ),
                  ),

                  SizedBox(height: AppDimensions.largeSpacing(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildOtpInput(controller: otp1),
                      BuildOtpInput(controller: otp2),
                      BuildOtpInput(controller: otp3),
                      BuildOtpInput(controller: otp4),
                      BuildOtpInput(controller: otp5),
                      BuildOtpInput(controller: otp6),
                    ],
                  ),
                  SizedBox(height: AppDimensions.largeSpacing(context)),
                  Center(
                    child: CustomButton(
                      onPress: () {
                        final code =
                            otp1.text + otp2.text + otp3.text + otp4.text + otp5.text + otp6.text;
                        context.read<SignInCubit>().signInWithSmsCode(
                          verificationId: verificationId,
                          smsCode: code,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildOtpInput extends StatelessWidget {
  const BuildOtpInput({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.darkMediumGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(border: InputBorder.none),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
