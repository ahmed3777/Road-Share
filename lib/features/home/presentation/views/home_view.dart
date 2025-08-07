import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/services/get_it_services.dart';
import 'package:roadshare/core/widgets/custom_Navigation_bar.dart';
import 'package:roadshare/features/home/presentation/cubit/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child:Text('Current Location',style: TextStyles.light13)),
        ),
        body: CustomNavigationBar(),

            ),
    );
  }
}
