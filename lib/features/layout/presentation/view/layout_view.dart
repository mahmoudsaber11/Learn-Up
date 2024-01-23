import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: 2, elevation: 20, items: [
        BottomNavigationBarItem(
            activeIcon: Image.asset(AppAssets.iconActiveHome),
            icon: Image.asset(
              AppAssets.iconHome,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            activeIcon: Image.asset(AppAssets.iconActiveFavorite),
            icon: Image.asset(AppAssets.iconFavorite),
            label: "Favorite"),
        BottomNavigationBarItem(
            activeIcon: Image.asset(AppAssets.iconActiveProfile),
            icon: Image.asset(AppAssets.iconProfile),
            label: "Profile"),
      ]),
    );
  }
}
