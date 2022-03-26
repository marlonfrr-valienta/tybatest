import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tybatest/core/application/injector.dart';
import 'package:tybatest/core/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tybatest/ui/common/debouncer.dart';
import 'package:tybatest/ui/common/custom_text_field.dart';
import 'package:tybatest/ui/views/auth/auth.dart';
import 'package:tybatest/ui/views/recent/recent_searches.dart';
import 'package:tybatest/ui/views/search/search_results_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchTextController = TextEditingController();
  final Debouncer _debouncer = Debouncer();

  void saveNewRecord(String newRecord) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recentSearches = prefs.getStringList('recent_searches') ?? [];
    recentSearches.insert(0, newRecord);
    prefs.setStringList('recent_searches', recentSearches);
  }

  void textChanged(String value) {
    _debouncer.onSearchChanged(() async {
      context.read(restaurantSearchTermProvider).state = value;
      saveNewRecord(value);
    }, 500);
  }

  void logout() {
    locator<SharedPreferences>().clear();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder) => const AuthView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Restaurantes'),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _searchTextController,
              onChangeCallback: textChanged,
            ),
            TextButton(
                child: const Text('Búsquedas recientes'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecentSearchesView()));
                }),
            TextButton(child: const Text('Cerrar sesión'), onPressed: logout),
            const SearchResultsList()
          ],
        ),
      ),
    );
  }
}
