import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/favorite/presentation/view/favorite_view.dart';
import 'package:learn_up/features/home/presentation/view/home_view.dart';
import 'package:learn_up/features/layout/data/repositories/layout_repo.dart';
import 'package:learn_up/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:learn_up/features/profile/presentation/view/profile_view.dart';

class LayoutRepoImpl implements LayoutRepo {
  @override
  void changeBottomNav({required int index, required context}) {
    BlocProvider.of<LayoutCubit>(context).currentIndex = index;
  }

  @override
  List<Widget> views() {
    return [
      const HomeView(),
      const FavoriteView(),
      const ProfileView(),
    ];
  }
}
