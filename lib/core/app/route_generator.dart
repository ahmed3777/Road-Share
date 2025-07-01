import 'package:flutter/material.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/features/auth/presentation/views/signup_view.dart';
import 'package:roadshare/features/home/presentation/home_view.dart';
import 'package:roadshare/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:roadshare/features/splash/splash_view.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {

        case SplashView.routeName: return MaterialPageRoute(builder: (_) => const SplashView());

        case OnBoardingView.routeName: return MaterialPageRoute(builder: (_) => const OnBoardingView());

        case LoginView.routeName: return MaterialPageRoute(builder: (_) => const LoginView());

                case SignupView.routeName: return MaterialPageRoute(builder: (_) => const SignupView());

        
        case HomeView.routeName: return MaterialPageRoute(builder: (_) => const HomeView());
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