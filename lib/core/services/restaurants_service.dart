import 'package:dio/dio.dart';
import 'package:tybatest/constants/endpoints.dart';
import 'package:tybatest/core/application/injector.dart';
import 'package:tybatest/core/models/restaurant.dart';

abstract class IRestaurantsRepository {
  Future<List<Restaurant>?>? searchNearbyRestaurants(String location);
}

class RestaurantsService implements IRestaurantsRepository {
  @override
  Future<List<Restaurant>?>? searchNearbyRestaurants(String location) async {
    var url = RestaurantsServiceAPI.baseUrl + RestaurantsServiceAPI.nearByRestaurants + '&query=$location';
    try {
      Response response = await locator<Dio>().get(url);
      List<dynamic> rawRestaurants = response.data['results'];
      return List.from(rawRestaurants.map((e) => Restaurant.fromJson(e)));
    } catch (e) {
      return null;
    }
  }
}
