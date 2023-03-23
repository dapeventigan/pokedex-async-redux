import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/utilities/string_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: This will be removed later
    StoreProvider.dispatch(context, GetPokemonsAction());
    StoreProvider.dispatch(context, GetPokemonDetailsAction(pokemonName: pokemonNameInput));

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(homePageTitle),
        ),
      ),
    );
  }
}
