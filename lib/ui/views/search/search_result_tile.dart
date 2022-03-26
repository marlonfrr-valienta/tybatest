import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {
  final String name;
  final double rating;
  const SearchResultTile({required this.name, required this.rating, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(name)),
          Flexible(child: Text('Estrellas: $rating')),
        ],
      ),
    );
  }
}
