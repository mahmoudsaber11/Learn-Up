import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/layout/data/repositories/layout_repo.dart';
import 'package:learn_up/features/layout/presentation/cubit/layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required this.layoutRepo}) : super(const LayoutInitial());
  final LayoutRepo layoutRepo;
  var currentIndex = 0;

  void changeBottomNav(int index, BuildContext context) {
    layoutRepo.changeBottomNav(index: index, context: context);
    emit(ChangeBottomNavState(index));
  }

  List<Widget> views() {
    return layoutRepo.views();
  }
}
