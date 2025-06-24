import 'package:flutter/material.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/features/onboarding/presentation/views/widgets/page_view_item.dart';
import 'package:roadshare/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children:  [
        PageViewItem(
           title: S.of(context).onboardingtitle1, 
           image: Assets.imagesOnbording2,
           subtitle: S.of(context).onboardingsubtitle1
           ),

         PageViewItem(title: S.of(context).onboardingtitle2, 
                       image: Assets.imagesOnboarding1,
                       subtitle: S.of(context).onboardingsubtitle2
                       ),
      ],
    );
  }
}