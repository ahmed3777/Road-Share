import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_dimensions.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/core/widgets/custom_bottom_nav_item.dart';
import 'package:roadshare/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:roadshare/features/home/presentation/views/widgets/pick_destination_widget.dart';
import 'package:roadshare/generated/l10n.dart';

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

  void _openAddRideSheet ( BuildContext context) {
    showModalBottomSheet(

      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return  SizedBox(
          height: AppDimensions.screenHeight(context)*0.75,
          child: PickDestinationWidget(
            onSendSuccess: () {
              Navigator.pop(context); // يقفل الـ BottomSheet
            },
          ),
        );
          
      },
    );
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
      appBar: AppBar(
        title:  Text(S.of(context).ROADSHARE),

      ),
      body: widgetOptions[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 4,
        onPressed: () => _openAddRideSheet(context),
        backgroundColor: AppColors.routePolyline,
        tooltip: 'Add',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
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
                label: S.of(context).home,
                isSelected: _selectedIndex == 0,
              ),
              CustomBottomNavItem(
                icon: Assets.imagesTaxi,
                label: S.of(context).cars,
                isSelected: _selectedIndex == 1,
              ),
              CustomBottomNavItem(
                icon: Assets.imagesHandCoins,
                label: S.of(context).rides,
                isSelected: _selectedIndex == 2,
              ),
              CustomBottomNavItem(
                icon: Assets.imagesIconprofile,
                label: S.of(context).profile,
                isSelected: _selectedIndex == 3,
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
