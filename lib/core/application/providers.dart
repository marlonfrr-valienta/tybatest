import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tybatest/core/application/restaurants_notifier.dart';
import 'package:tybatest/core/models/user.dart';
import 'package:tybatest/core/services/auth_service.dart';
import 'package:tybatest/core/services/restaurants_service.dart';

final usersRepositoryProvider = Provider<IAuthRepository>((ref) => AuthService());

final userProvider = StateProvider<User?>((ref) => null);

final restaurantsRepositoryProvider = Provider<IRestaurantsRepository>((ref) => RestaurantsService());

final restaurantsProvider = StateNotifierProvider((ref) => RestaurantsNotifier(ref, ref.watch(restaurantsRepositoryProvider)));

final restaurantSearchTermProvider = StateProvider<String>((ref) => "");

// final recentSearchesProvider = StateNotifierProvider((ref) => RecentSearchesNotifier());
