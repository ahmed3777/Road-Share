import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/custom_progress_ind.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_cubit.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_state.dart';
import 'package:roadshare/features/auth/presentation/views/profile_views.dart';
import 'package:roadshare/features/auth/presentation/views/signup_view.dart';
import 'package:roadshare/features/home/presentation/views/home_view.dart';
import 'package:roadshare/generated/l10n.dart';
import 'package:roadshare/features/auth/presentation/views/widgets/social_login.dart';

class SocialBlocCounsumer extends StatelessWidget {
  const SocialBlocCounsumer({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is GoogleSignInFailure) {
           showErrorBar(context, state.message);
        }
        if (state is GoogleSignInSuccess) {
          final user = state.user;
          if (user.phone == null || user.phone!.isEmpty) {
            Navigator.pushNamed(context, ProfileView.routeName,
                arguments: user);
          }else{
            Navigator.pushReplacementNamed(context, HomeView.routeName);}
        }
      },
      builder: (context, state) {
        return state is GoogleSignInLoading ? Center(child: const CustomProgressInd()) : Center(
          child: SocialLogin(
            onPressed: () {
              Navigator.pushNamed(context, SignupView.routeName);
            },
            text: S.of(context).Sign_up,
          ),
        );
      },
    );
  }
}
