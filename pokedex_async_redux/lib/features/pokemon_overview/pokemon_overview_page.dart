import 'dart:async';

import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_overview_page_card.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_overview_search.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchedPokemons,
    required this.filterPokemons,
    required this.clearSearchedPokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final Function(String) filterPokemons;
  final VoidCallback clearSearchedPokemons;

  @override
  State<PokemonOverviewPage> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController _searchController;
  late bool isSearching;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    isSearching = false;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    if (widget.searchedPokemons.isNotEmpty) {
      widget.clearSearchedPokemons();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        backgroundColor: appDefaultColor,
      ),
      body: Column(
        children: [
          PokemonSearchBar(
            textController: _searchController,
            clearSearchBar: _clearSearchedPokemons,
            textChanged: _searchingPokemon,
          ),
          Expanded(
            child: widget.pokemons.when(
              loading: () => const Center(child: CircularProgressIndicator(color: appDefaultColor)),
              error: (errorMessage) {
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage ?? emptyString));
                return const Center(child: Text(noPokemonsAvailable));
              },
              (data) {
                if (isSearching) data = widget.searchedPokemons;
                if (data.isEmpty) {
                  return Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: colorBlack),
                        children: [
                          const TextSpan(text: cannotFindPokemonText),
                          TextSpan(text: _searchController.text, style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final pokemon = data.elementAt(index);
                      return PokemonCard(pokemon: pokemon);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _clearSearchedPokemons() {
    widget.clearSearchedPokemons;
    setState(() {
      _searchController.text = emptyString;
      isSearching = false;
    });
  }

  void _searchingPokemon(String queryText) {
    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () => setState(() {
        if (queryText.isEmpty) isSearching = false;
        isSearching = true;
        widget.filterPokemons(queryText);
      }),
    );
  }
}
