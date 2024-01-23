import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/features/home/presentation/widgets/custom_search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .07, left: 16.w),
      child: const Column(
        children: [
          CustomSearchTextField(),
        ],
      ),
    );
  }
}
