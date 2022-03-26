import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tybatest/constants/endpoints.dart';
import 'package:tybatest/core/application/injector.dart';
import 'package:tybatest/core/models/user.dart';

abstract class IAuthRepository {
  Future<User?> signUp(String email, String password);
  Future<User?> logIn(String email, String password);
}

class AuthService implements IAuthRepository {
  @override
  Future<User?> signUp(String email, String password) async {
    var url = AuthServiceAPI.signUpBaseUrl;

    try {
      Response response = await locator<Dio>().post(url, data: {"email": email, "password": password, "returnSecureToken": true});
      locator<SharedPreferences>().setString('accessToken', response.data['idToken']);
      locator<SharedPreferences>().setString('refreshToken', response.data['refreshToken']);
      return User.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }

  @override
  Future<User?> logIn(String email, String password) async {
    var url = AuthServiceAPI.logInBaseUrl;

    try {
      Response response = await locator<Dio>().post(url, data: {"email": email, "password": password});
      locator<SharedPreferences>().setString('accessToken', response.data['idToken']);
      return User.fromJson(response.data);
    } on DioError catch (e) {
      return null;
    }
  }
}
