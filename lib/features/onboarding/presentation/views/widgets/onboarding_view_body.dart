import 'package:flutter/material.dart';
import 'package:roadshare/features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});


  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}
 PageController controller = PageController();

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
      ],
    );
  }
}