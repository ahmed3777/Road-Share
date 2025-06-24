import 'package:flutter/material.dart';
import 'package:roadshare/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:roadshare/generated/l10n.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar.new(
        actions: [
          TextButton(onPressed: () {}, child:  Text(S.of(context).Skip)),
        ],
      ),
      body: const OnboardingViewBody(),
    );
  }
}
