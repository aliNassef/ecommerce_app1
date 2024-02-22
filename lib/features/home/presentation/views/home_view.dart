import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/assets.dart';
import 'package:ecommerce_app/features/favorite/presentation/views/favorite_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/category_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:ecommerce_app/features/setting/presentations/views/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  // list => widget (Scaffold)
  // items => icons
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: const [
        HomeViewBody(),
        CategoryView(),
        FavoriteView(),
        SettingView()
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Image.asset(
            ImageData.vv1,
          ),
          inactiveIcon: Image.asset(ImageData.v1),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ImageData.vv2),
          inactiveIcon: Image.asset(ImageData.v2),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ImageData.vv3),
          inactiveIcon: Image.asset(ImageData.v3),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ImageData.vv4),
          inactiveIcon: Image.asset(ImageData.v4),
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: kPrimaryColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
