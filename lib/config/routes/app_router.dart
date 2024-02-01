import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/api/dio_consumer.dart';
import 'package:learn_up/features/auth/data/repositories/login/login_repo_impl.dart';
import 'package:learn_up/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:learn_up/features/auth/presentation/views/forget_password_view.dart';
import 'package:learn_up/features/auth/presentation/views/login_view.dart';
import 'package:learn_up/features/auth/presentation/views/reset_password_view.dart';
import 'package:learn_up/features/auth/presentation/views/sign_up_view.dart';
import 'package:learn_up/features/auth/presentation/views/verification_view.dart';
import 'package:learn_up/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:learn_up/features/layout/presentation/view/layout_view.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:learn_up/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:learn_up/features/splash/presentation/view/splash_view.dart';
import 'package:learn_up/features/topics/presentation/view/topics_view.dart';
import 'package:learn_up/service_locator.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => serviceLocator.get<OnBoardingCubit>(),
                child: const OnBoardingView()));

      case Routes.loginViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => LoginCubit(
                    loginRepo:
                        LoginRepoImpl(dioConsumer: DioConsumer(dio: Dio()))),
                child: const LoginView()));

      case Routes.signUpViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => SignUpCubit(), child: const SignUpView()));

      case Routes.layoutViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => serviceLocator.get<LayoutCubit>(),
                child: const LayoutView()));

      case Routes.forgetPasswordViewRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView());

      case Routes.verificationViewRoute:
        return MaterialPageRoute(
            builder: (context) => const VerificationView());

      case Routes.resetPasswordViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => ResetPasswordCubit(),
                child: const ResetPasswordView()));

      case Routes.topicsViewRoute:
        return MaterialPageRoute(builder: (context) => const TopicsView());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
