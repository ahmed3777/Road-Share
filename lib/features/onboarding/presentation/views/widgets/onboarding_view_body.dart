import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/features/onboarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:roadshare/generated/l10n.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _pageController;
  var currentPage = 0;
  @override
  void initState() {
      _pageController = PageController();
      _pageController.addListener(() => setState(() => currentPage = _pageController.page!.round()));
      super.initState();
  }

    @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: OnBoardingPageView(
          pageController: _pageController,
        )),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppDimensions.smallPadding, vertical: AppDimensions.mediumPadding),
          child: SizedBox(
            width:150,
            height: 50,
            child: MaterialButton(onPressed: () {
              if(currentPage < 2){
                _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
              }else{
                Navigator.pushNamed(context, LoginView.routeName);
              }
            }, 
              color: AppColors.routePolyline,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               child:  currentPage < 2 ? Text(S.of(context).Next, style: TextStyles.semiBold16.copyWith(color: Colors.white),) 
                : Text(S.of(context).GetStarted,
                 style: TextStyles.semiBold16.copyWith(color: Colors.white),
            ),
            )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.smallPadding, vertical: AppDimensions.mediumPadding),
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0), 
              color: AppColors.darkMediumGray,
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              activeColor: AppColors.routePolyline,
              
            ),
          ),
        )
      ],
    );
  }
}