import 'package:flutter/material.dart';
import 'package:roadshare/core/utils/constants.dart';
import 'package:roadshare/features/auth/data/models/app_user.dart';
import 'package:roadshare/features/auth/presentation/views/profile_views.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/features/auth/presentation/views/otp_view.dart';
import 'package:roadshare/features/auth/presentation/views/signup_view.dart';
import 'package:roadshare/features/home/presentation/views/home_view.dart';
import 'package:roadshare/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:roadshare/features/splash/splash_view.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {

        case SplashView.routeName: return MaterialPageRoute(builder: (_) => const SplashView());

        case OnBoardingView.routeName: return MaterialPageRoute(builder: (_) => const OnBoardingView());
        
        case ProfileView.routeName: 
         final user = args as AppUser;
        return MaterialPageRoute(builder: (_) => ProfileView(user: user,
          
        ));

        case LoginView.routeName: return MaterialPageRoute(builder: (_) => const LoginView());

        case SignupView.routeName: return MaterialPageRoute(builder: (_) => const SignupView());

        case HomeView.routeName: return MaterialPageRoute(builder: (_) => const HomeView());

   case OtpView.routeName:
        // ✅ استقبال الـ arguments بأمان
        if (args is Map) {
          final verificationId = args[Constants.kVerificationId] as String?;
          final phoneNumber = args[Constants.kPhoneNumber] as String?;

          // تأكد من القيم
          if (verificationId != null && phoneNumber != null) {
            return MaterialPageRoute(
              builder: (_) => OtpView(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
              ),
            );
          }
        }
        return _errorRoute();

      default:
      // If there is no such named route, return an error page
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Route not found'),
        ),
      );
    });
  }
}