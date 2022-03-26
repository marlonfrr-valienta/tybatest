import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tybatest/core/application/providers.dart';
import 'package:tybatest/core/models/restaurant.dart';
import 'package:tybatest/core/services/restaurants_service.dart';

class RestaurantsNotifier extends StateNotifier<AsyncValue<List<Restaurant>>> {
  final ProviderReference ref;
  final IRestaurantsRepository _restaurantsRepository;
  RestaurantsNotifier(this.ref, this._restaurantsRepository) : super(const AsyncValue.loading()) {
    getRestaurants();
  }

  Future<void> getRestaurants() async {
    var restaurantsSearchTerm = ref.watch(restaurantSearchTermProvider).state;
    if (restaurantsSearchTerm.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }
    final List<Restaurant>? restaurants = await _restaurantsRepository.searchNearbyRestaurants(restaurantsSearchTerm);
    if (restaurants != null) {
      state = AsyncValue.data(restaurants);
    } else {
      state = AsyncError('Error');
    }
  }
}
