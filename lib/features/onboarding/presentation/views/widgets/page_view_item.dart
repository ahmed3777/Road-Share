import 'package:flutter/material.dart';

import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/services/shared_preferences_singleton.dart';
import 'package:roadshare/core/utils/constants.dart';
import 'package:roadshare/features/auth/presentation/views/login_view.dart';
import 'package:roadshare/generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle, required this.isvisible,
  });

  final String title, image, subtitle;
  final bool isvisible ;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(AppDimensions.mediumPadding(context)),
      child: Column(
        children: [
              Row(
                children: [
                  Visibility(
                    visible: isvisible,
                    child: TextButton(
                      onPressed: () {
                        SharedPref.setData(Constants.kIsOnboardingView, true) ;
                        Navigator.pushReplacementNamed(context, LoginView.routeName);
                      },
                      child: Text(S.of(context).Skip),
                    ),
                  ),
                ],
              ),
          Spacer( flex: 1,),
          // Centered Content
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyles.bold20,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    subtitle,
                    style: TextStyles.regular14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        
      );
    
  }
}
