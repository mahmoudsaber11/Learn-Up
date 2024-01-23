import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:learn_up/features/layout/presentation/cubit/layout_state.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.views()[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.changeBottomNav(value, context);
              },
              currentIndex: cubit.currentIndex,
              elevation: 20,
              items: [
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
      },
    );
  }
}
