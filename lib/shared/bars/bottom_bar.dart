import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.primary.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomBarItem(
              onPressed: () => {Get.offNamed(AppRoutes.home)},
              icon: Icons.home_outlined,
              isActive: currentIndex == 0,
            ),
            BottomBarItem(
              onPressed: () => {Get.offNamed(AppRoutes.expenseDetails)},
              icon: Icons.bar_chart_outlined,
              isActive: currentIndex == 1,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () =>
                  {Get.offNamed(AppRoutes.prepaid + AppRoutes.prepaidCreate)},
              icon: const Icon(
                Icons.add_circle_outlined,
                size: 48,
                color: AppColor.primary,
              ),
            ),
            BottomBarItem(
              onPressed: () => {Get.offNamed(AppRoutes.prepaid)},
              icon: Icons.note_alt_outlined,
              isActive: currentIndex == 2,
            ),
            BottomBarItem(
              onPressed: () => {Get.offNamed(AppRoutes.family)},
              icon: Icons.people_alt_outlined,
              isActive: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final bool isActive;

  const BottomBarItem({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: isActive ? () => {} : onPressed,
      icon: Icon(
        icon,
        size: 32,
        color: isActive ? AppColor.primary : AppColor.black,
      ),
    );
  }
}
