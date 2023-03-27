import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/features/widget/pokemon_overview_page_card.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        backgroundColor: appDefaultColor,
      ),
      body: pokemons.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: appDefaultColor),
        ),
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage!));
          return const Center(child: Text(noPokemonAvailable));
        },
        (data) => Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final pokemon = data[index];
              return PokemonCard(pokemon: pokemon);
            },
          ),
        ),
      ),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
