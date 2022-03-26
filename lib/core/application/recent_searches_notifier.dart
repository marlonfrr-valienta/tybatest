// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:valienta/core/dependencyInjector.dart';

// class RecentSearchesNotifier extends StateNotifier<List<String>> {
//   RecentSearchesNotifier() : super([]) {
//     getRecentSearches();
//   }

//   void getRecentSearches() {
//     state = locator<SharedPreferences>().getStringList('recent_searches') ?? [];
//   }

//   Future<void> setNewRecentSearch(String newRecentSearch) async {
//     List<String> list = state;
//     if (list.contains(newRecentSearch)) list.removeWhere((element) => element == newRecentSearch);
//     list.insert(0, newRecentSearch);
//     if (list.length == 8) list.removeLast();
//     // If I just setStringList(list.add(newRecentSearch)) will not work
//     // because .add doens't return the new list
//     locator<SharedPreferences>().setStringList('recent_searches', list);
//   }
// }
