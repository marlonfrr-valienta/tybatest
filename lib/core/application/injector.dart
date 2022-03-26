import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tybatest/core/services/auth_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({bool testing = false}) async {
  if (testing) {
    // Create Mock services to set up in testing enviroment locator
  } else {
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerSingleton(sharedPreferences);
    locator.registerLazySingleton<Dio>(() => Dio());
    locator.registerLazySingleton<IAuthRepository>(() => AuthService());
  }
}
