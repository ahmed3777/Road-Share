import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roadshare/core/app/app_color.dart';

class CustomBottomNavItem extends BottomNavigationBarItem {
  CustomBottomNavItem({
    required String icon,
    required String label,
    required bool isSelected,
  }) : super(
          icon: SvgPicture.asset(
            icon,
            colorFilter:const ColorFilter.mode(AppColors.darkGray, BlendMode.srcIn),
            width: 20,
            height: 20,
          ),
          activeIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              icon,
              colorFilter:
                  const ColorFilter.mode(AppColors.routePolyline, BlendMode.srcIn),
              width: 25,
              height: 25,
            ),
          ),
          label: label,
        );
}
