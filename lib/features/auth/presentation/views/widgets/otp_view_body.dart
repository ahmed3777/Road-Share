import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/widgets/custom_button.dart';
import 'package:roadshare/core/widgets/custom_progress_hub.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_cubit.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_state.dart';
import 'package:roadshare/features/auth/presentation/views/profile_views.dart';
import 'package:roadshare/features/home/presentation/views/home_view.dart';
import 'package:roadshare/generated/l10n.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });
  final String verificationId;
  final String phoneNumber;

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

  late FocusNode fn1;
  late FocusNode fn2;
  late FocusNode fn3;
  late FocusNode fn4;
  late FocusNode fn5;
  late FocusNode fn6;

  @override
  void initState() {
    otp1 = TextEditingController();
    otp2 = TextEditingController();
    otp3 = TextEditingController();
    otp4 = TextEditingController();
    otp5 = TextEditingController();
    otp6 = TextEditingController();

    fn1 = FocusNode();
    fn2 = FocusNode();
    fn3 = FocusNode();
    fn4 = FocusNode();
    fn5 = FocusNode();
    fn6 = FocusNode();
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

    fn1.dispose();
    fn2.dispose();
    fn3.dispose();
    fn4.dispose();
    fn5.dispose();
    fn6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verificationId = widget.verificationId;
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is PhoneAuthError) {
          showErrorBar(context, state.message);
        } else if (state is PhoneAuthVerified) {
           final user = state.user;
          if (user.name == null || user.name!.isEmpty) {
            Navigator.pushNamed( context, ProfileView.routeName,
             arguments: user);
          } else {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
           }
        }
      },
      builder: (context, state) {
        return CoustomProgressHUD( isLoading: state is PhoneAuthLoading,
          child:
             Padding(
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
                            "Enter 6 digit code which was sent to ${widget.phoneNumber}",
                            style: TextStyles.light12.copyWith(
                              color: AppColors.darkBg,
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.largeSpacing(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildOtpInput(
                              controller: otp1,
                              focusNode: fn1,
                              nextFocusNode: fn2,
                            ),
                            BuildOtpInput(
                              controller: otp2,
                              focusNode: fn2,
                              nextFocusNode: fn3,
                            ),
                            BuildOtpInput(
                              controller: otp3,
                              focusNode: fn3,
                              nextFocusNode: fn4,
                            ),
                            BuildOtpInput(
                              controller: otp4,
                              focusNode: fn4,
                              nextFocusNode: fn5,
                            ),
                            BuildOtpInput(
                              controller: otp5,
                              focusNode: fn5,
                              nextFocusNode: fn6,
                            ),
                            BuildOtpInput(controller: otp6, focusNode: fn6),
                          ],
                        ),
                        SizedBox(height: AppDimensions.largeSpacing(context)),
                        Center(
                          child: CustomButton(
                            text: S.of(context).Continue,
                            onPress: () {
                              final code =
                                  otp1.text +
                                  otp2.text +
                                  otp3.text +
                                  otp4.text +
                                  otp5.text +
                                  otp6.text;
                              context.read<SignInCubit>().verifyOtp(
                                verificationId,
                                code,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             )
            );
      },
    );
  }
}

class BuildOtpInput extends StatelessWidget {
  const BuildOtpInput({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
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

          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty && nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          onSubmitted: (_) {
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          maxLength: 1,
          focusNode: focusNode,
        ),
      ),
    );
  }
}
