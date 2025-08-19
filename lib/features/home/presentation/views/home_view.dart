import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/services/get_it_services.dart';
import 'package:roadshare/core/widgets/custom_Navigation_bar.dart';
import 'package:roadshare/features/auth/presentation/cubit/profile/profile_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProfileCubit>( )),
      ],
      child:  CustomNavigationBar(),
      
    );
  }
}
