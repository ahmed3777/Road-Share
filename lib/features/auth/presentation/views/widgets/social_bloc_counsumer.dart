  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/features/auth/presentation/cubit/cubit/sign_in_cubit.dart';
import 'package:roadshare/features/auth/presentation/views/signup_view.dart';
import 'package:roadshare/features/home/presentation/home_view.dart';
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
        if (state is SignInFailure) {
             showErrorBar(context, state.message);
        }
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const CircularProgressIndicator();
        }
        return SocialLogin(
          onPressed: () {
            Navigator.pushNamed(context, SignupView.routeName);
          },
          text: S.of(context).Sign_up,
        );
      },
    );
  }
}
