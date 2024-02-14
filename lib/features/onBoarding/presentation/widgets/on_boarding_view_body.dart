import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';

import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_state.dart';
import 'package:learn_up/features/onBoarding/presentation/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        OnBoardingCubit cubit = BlocProvider.of<OnBoardingCubit>(context);
        return Column(
          children: [
            MySizedBox.height50,
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) => PageViewItem(
                  pageInfo: cubit.onBoardingPages()[index],
                ),
                itemCount: cubit.onBoardingPages().length,
                onPageChanged: (int index) {
                  cubit.onChangePageIndex(index);
                },
              ),
            ),
            CustomGeneralButton(
                width: 326.w,
                text: cubit.isLastBoarding ? "Get Started" : "Next",
                onPressed: () => _navigateAmongOnBoarding(context)),
            SizedBox(
              height: MediaQuery.of(context).size.height * .12.h,
            ),
          ],
        );
      },
    );
  }

  void _navigateAmongOnBoarding(BuildContext context) {
    if (BlocProvider.of<OnBoardingCubit>(context).isLastBoarding) {
      BlocProvider.of<OnBoardingCubit>(context).skipToLogin(context: context);
    } else {
      BlocProvider.of<OnBoardingCubit>(context).navigateBetweenPages(
        context: context,
        pageController: pageController,
      );
    }
  }
}
