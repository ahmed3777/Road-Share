import 'package:flutter/material.dart';
import 'package:roadshare/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(child: const OnboardingViewBody()),
    );
  }
}
