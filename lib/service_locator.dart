import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    await _setupForExternal();
  }

  Future<void> _setupForExternal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    serviceLocator
        .registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }
}
