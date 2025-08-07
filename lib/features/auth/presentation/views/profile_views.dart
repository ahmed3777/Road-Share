import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/core/services/get_it_services.dart';
import 'package:roadshare/core/widgets/custom_progress_hub.dart';
import 'package:roadshare/features/auth/data/models/app_user.dart';
import 'package:roadshare/features/auth/presentation/cubit/profile/profile_cubit.dart';
import 'package:roadshare/features/auth/presentation/views/widgets/profile_view_body.dart';
import 'package:roadshare/features/home/presentation/views/home_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});
  final AppUser user;
  static const routeName = 'completeProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>(param1: user),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              showErrorBar(context, 'Profile updated successfully');
              Navigator.pushReplacementNamed(
                context,
                HomeView.routeName,
              );
            } else if (state is ProfileError) {
              showErrorBar(context, state.message);
            }
          },
          builder: (context, state) {
              return CoustomProgressHUD( isLoading: state is ProfileLoading,
                 child:  ProfileViewBody(user: user),
                 
              );
          }
        ),
      ),
    );
  }
}
