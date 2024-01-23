import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:learn_up/features/auth/presentation/views/login_view.dart';
import 'package:learn_up/features/auth/presentation/views/sign_up_view.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:learn_up/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:learn_up/features/splash/presentation/view/splash_view.dart';
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
                create: (context) => LoginCubit(), child: const LoginView()));

      case Routes.signUpViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => SignUpCubit(), child: const SignUpView()));

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
