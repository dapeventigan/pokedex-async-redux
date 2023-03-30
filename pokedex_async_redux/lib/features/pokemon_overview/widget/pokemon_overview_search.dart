import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonSearchBar extends StatelessWidget {
  const PokemonSearchBar({
    required this.textController,
    required this.clearSearchBar,
    required this.textChanged,
    super.key,
  });

  final TextEditingController textController;
  final VoidCallback clearSearchBar;
  final Function(String) textChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              onChanged: (searchQuery) => textChanged(searchQuery),
              decoration: const InputDecoration(
                hintText: searchForPokemonsText,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: clearSearchBar,
          ),
        ],
      ),
    );
  }
}
