import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/services/shared_preferences_singleton.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/utils/constants.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
    late AnimationController animationController;
    late Animation<Offset> offset;
     @override
  void initState() {
    super.initState();
     initSlidingAnimation();
     excuteNavigation();
  }
    @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
   void excuteNavigation() async {
    Future.delayed(const Duration(seconds:3), () async {
      try {
          bool isOnboardingView = await SharedPref.getBool(Constants.kIsOnboardingView);
          if (isOnboardingView) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          }else{
         Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
          }
         // Navigator.pushReplacementNamed(context, HomeView.routeName);
        // bool isLoggedInSocial = FirebaseAuthService().isLoggedIn();
        // bool isLoggedIn = await getIt<AuthRepoImp>().isUserLoggedIn();
        // Navigate based on login status
        // if (isLoggedInSocial || isLoggedIn) {
        //   Navigator.pushReplacementNamed(context, HomeView.routeName);
        // } else {
        //   Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        // }
      } catch (e) {
        print("Error during navigation: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
       spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(Assets.imagesSplash),
          ),
          AnimatedBuilder(
            animation: offset,
            builder: (context, child) {
              return SlideTransition(
                position: offset,
                child: child,
              );
            },
            child: Text('Welcome to RoadShare',
             style:TextStyles.bold20.copyWith(color: AppColors.routePolyline),
          ),
          ),
        ],
      ),
    );
  } 
    void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

      offset = Tween<Offset>(
      begin: const Offset(0, 3),
      end: const Offset(0.0, 0.0),
    ).animate(animationController);
    animationController.forward();
  }
}


  
