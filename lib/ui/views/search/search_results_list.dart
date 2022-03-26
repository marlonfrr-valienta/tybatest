import 'package:flutter/material.dart';
import 'package:tybatest/core/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tybatest/ui/views/search/search_result_tile.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
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
                        return SearchResultTile(
                          name: restaurants[index].name!,
                          rating: restaurants[index].rating!,
                        );
                      }),
                );
        }, loading: () {
          return const CircularProgressIndicator();
        }, error: (err, st) {
          return const Text('Ha ocurrido un error');
        });
      },
    );
  }
}
