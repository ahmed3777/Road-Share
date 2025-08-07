import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/widgets/custom_bottom_nav_item.dart';
import 'package:roadshare/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:roadshare/features/home/presentation/views/home_view_body.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const HomeViewBody(),
      const Center(child: Text('Cars')),
      const Center(child: Text('Rides')),
      const Center(child: Text('Profile')),
    ];

    return Scaffold(
      body: 
          widgetOptions[_selectedIndex],
          floatingActionButton:   FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 4,
            onPressed: () => context.read<HomeCubit>().getCurrentLocation(),
            backgroundColor: AppColors.routePolyline,
            tooltip: 'Add',
            child: const Icon(Icons.add, color: Colors.white),
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:
       SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              CustomBottomNavItem(
                icon: Assets.imagesHome,
                label: "Home", 
                isSelected: _selectedIndex == 0
              ),
              CustomBottomNavItem(
                icon: Assets.imagesTaxi,
                label: "Cars", 
                isSelected: _selectedIndex == 1
              ),
              CustomBottomNavItem(
                icon: Assets.imagesHandCoins,
                label: "Rides", 
                isSelected: _selectedIndex == 2
              ),
              CustomBottomNavItem(
                icon: Assets.imagesIconprofile,
                label: "Profile", 
                isSelected: _selectedIndex == 3
              ),
            ],
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _onItemTapped,
            selectedItemColor: AppColors.darkOrange,
            unselectedItemColor: AppColors.darkOrangeAccent,
          ),
        ),
      ),
    );
  }
}