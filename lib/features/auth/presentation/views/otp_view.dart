import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/services/get_it_services.dart';
import 'package:roadshare/features/auth/presentation/cubit/sinIn_cubit/sign_in_cubit.dart';
import 'package:roadshare/features/auth/presentation/views/widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.verificationId, required this.phoneNumber});
  static const routeName = 'otp';

  final String verificationId;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<SignInCubit>(),
          child: OtpViewBody(verificationId: verificationId, phoneNumber: phoneNumber,),
        ),
      ),
    );
  }
}
