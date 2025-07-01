import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/features/splash/splash_view.dart';
import 'package:roadshare/firebase_options.dart';
import 'package:roadshare/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app/route_generator.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar') ,
          debugShowCheckedModeBanner: false,
          title: 'Location App',
          theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryOrange,
              secondary: AppColors.infoBlue,
              error: AppColors.errorRed,
            ),
            // ... other theme config
          ),
          // darkTheme: ThemeData.dark().copyWith(
          //   colorScheme: ColorScheme.dark(
          //     primary: AppColors.darkOrangeAccent,
          //     secondary: AppColors.infoBlue,
          //   ),
          // ),
          initialRoute: SplashView.routeName,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
