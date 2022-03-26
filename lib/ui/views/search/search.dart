import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tybatest/core/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tybatest/ui/common/debouncer.dart';
import 'package:tybatest/ui/common/custom_text_field.dart';
import 'package:tybatest/ui/views/recent/recent_searches.dart';

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
            ElevatedButton(
                child: const Text('Búsquedas recientes'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecentSearchesView()));
                }),
            Consumer(
              builder: (context, watch, child) {
                final restaurantsState = watch(restaurantsProvider.state);
                return restaurantsState.when(data: (restaurants) {
                  return restaurants.isEmpty
                      ? const Text('Introduce una ciudad para buscar')
                      : Expanded(
                          child: ListView.builder(
                              itemCount: restaurants.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(restaurants[index].name!),
                                );
                              }),
                        );
                }, loading: () {
                  return const CircularProgressIndicator();
                }, error: (err, st) {
                  return Container(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
