import 'package:pokedex_async_redux/api/model/models.dart';
import 'package:pokedex_async_redux/features/widget/pokemon_overview_page_card.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/colors.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> _snackbarKey = GlobalKey<ScaffoldMessengerState>();

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  void _showErrorMessageSnackbar(String message) {
    final SnackBar snackBar = SnackBar(content: Text(message));
    _snackbarKey.currentState?.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _snackbarKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appBarTitle),
          backgroundColor: appDefaultColor,
        ),
        body: pokemons.when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: appDefaultColor,
            ),
          ),
          error: (errorMessage) {
            _showErrorMessageSnackbar(errorMessage ?? emptyString);
            return Center(
              child: Text(errorMessage ?? emptyString),
            );
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
      ),
    );
  }
}
