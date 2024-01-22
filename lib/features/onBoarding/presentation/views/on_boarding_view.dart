import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:learn_up/features/onBoarding/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              BlocProvider.of<OnBoardingCubit>(context)
                  .skipToLogin(context: context);
            },
            child: const Text("Skip"),
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
