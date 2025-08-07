import 'package:flutter/material.dart';
import 'package:roadshare/features/home/presentation/views/google_map.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomGoogleMap();
  }
}
