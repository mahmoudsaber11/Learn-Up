import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  final String title;
  final String image;
  final String subTitle;

  const OnBoardingModel(
      {required this.title, required this.image, required this.subTitle});

  @override
  List<Object?> get props => [title, image, subTitle];
}
