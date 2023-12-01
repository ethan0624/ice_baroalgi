import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final double tabSize;
  final int currentIndex;
  final ValueChanged<int>? onTabPressed;

  const AppBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    this.tabSize = 35,
    this.onTabPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: AppColor.dividerDark, blurRadius: 20),
        ],
      ),
      child: BottomNavigationBar(
        onTap: onTabPressed,
        currentIndex: currentIndex,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 0
                  ? 'assets/images/ic_tab_home.png'
                  : 'assets/images/ic_tab_unselected_home.png',
              width: tabSize,
              height: tabSize,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 1
                    ? 'assets/images/ic_tab_course.png'
                    : 'assets/images/ic_tab_unselected_course.png',
                width: tabSize,
                height: tabSize,
              ),
              label: 'Course'),
          BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 2
                    ? 'assets/images/ic_tab_mypage.png'
                    : 'assets/images/ic_tab_unselected_mypage.png',
                width: tabSize,
                height: tabSize,
              ),
              label: 'Mypage'),
        ],
      ),
    );
  }
}
