import 'package:equatable/equatable.dart';

abstract class LayoutState extends Equatable {
  const LayoutState();
  @override
  List<Object?> get props => [];
}

class LayoutInitial extends LayoutState {
  const LayoutInitial();
}

class ChangeBottomNavState extends LayoutState {
  final int index;

  const ChangeBottomNavState(this.index);
  @override
  List<Object?> get props => [index];
}
