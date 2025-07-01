import 'package:flutter/material.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/features/onboarding/presentation/views/widgets/page_view_item.dart';
import 'package:roadshare/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children:  [
        PageViewItem(
            isvisible: true,
           title: S.of(context).onboardingtitle1, 
           image: Assets.imagesOnbording2,
           subtitle: S.of(context).onboardingsubtitle1
           ),

         PageViewItem(
            isvisible: false,
            title: S.of(context).onboardingtitle2, 
                       image: Assets.imagesOnboarding1,
                       subtitle: S.of(context).onboardingsubtitle2
                     ),
         PageViewItem(
            isvisible: false,
            title: S.of(context).onboardingtitle3, 
                       image: Assets.imagesLocations,
                       subtitle: S.of(context).onboardingsubtitle3
                       ),
      ],
    );
  }
}