import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({
    required this.pokemons,
    required this.pokemonImage,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemons;
  final String pokemonImage;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemons: pokemons)),
      onDispose: (store) => store.dispatchSync(ClearPokemonDetailsAction()),
      builder: (_, vm) => PokemonDetailsPage(
        pokemonDetails: vm.pokemonDetails,
        pokemons: pokemons,
        pokemonImage: pokemonImage,
      ),
    );
  }
}
