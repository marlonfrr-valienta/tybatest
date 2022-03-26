import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tybatest/core/application/injector.dart';

class RecentSearchesView extends StatefulWidget {
  const RecentSearchesView({Key? key}) : super(key: key);

  @override
  State<RecentSearchesView> createState() => _RecentSearchesViewState();
}

class _RecentSearchesViewState extends State<RecentSearchesView> {
  List<String> recentSearches = [];

  void initialize() {
    setState(() {
      recentSearches = locator<SharedPreferences>().getStringList('recent_searches') ?? [];
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Búsquedas recientes'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: recentSearches.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(recentSearches[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
