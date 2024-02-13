import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_up/core/api/dio_consumer.dart';
import 'package:learn_up/core/helpers/cache_helper.dart';
import 'package:learn_up/features/auth/data/repositories/login/login_repo.dart';
import 'package:learn_up/features/auth/data/repositories/login/login_repo_impl.dart';
import 'package:learn_up/features/auth/data/repositories/sign_up/sign_up_repo.dart';
import 'package:learn_up/features/auth/data/repositories/sign_up/sign_up_repo_impl.dart';
import 'package:learn_up/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:learn_up/features/layout/data/repositories/layout_repo.dart';
import 'package:learn_up/features/layout/data/repositories/layout_repo_impl.dart';
import 'package:learn_up/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:learn_up/features/onBoarding/data/repositories/on_boarding_repo.dart';
import 'package:learn_up/features/onBoarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    await _setupForExternal();
    _setupForeCore();
    _setupForRepos();
    _setupForCubits();
  }

  Future<void> _setupForExternal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    serviceLocator
        .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    final dio = Dio()
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
          maxWidth: 90));

    serviceLocator.registerLazySingleton<Dio>(() => dio);
  }
}

void _setupForeCore() {
  serviceLocator.registerLazySingleton<CacheHelper>(
    () => CacheHelper(serviceLocator<SharedPreferences>()),
  );
  serviceLocator.registerLazySingleton<DioConsumer>(
    () => DioConsumer(dio: serviceLocator.get<Dio>()),
  );
}

void _setupForRepos() {
  serviceLocator
      .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());

  serviceLocator.registerLazySingleton<LayoutRepo>(() => LayoutRepoImpl());

  serviceLocator.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(
      dioConsumer: serviceLocator.get<DioConsumer>(),
    ),
  );
  serviceLocator.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(
      dioConsumer: serviceLocator.get<DioConsumer>(),
    ),
  );
}

void _setupForCubits() {
  serviceLocator.registerFactory<OnBoardingCubit>(() =>
      OnBoardingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()));

  serviceLocator.registerFactory<LayoutCubit>(
      () => LayoutCubit(layoutRepo: serviceLocator.get<LayoutRepo>()));

  serviceLocator.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()),
  );
  serviceLocator.registerFactory<SignUpCubit>(
    () => SignUpCubit(signUpRepo: serviceLocator.get<SignUpRepo>()),
  );
}
