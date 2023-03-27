import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/action/action.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

/// Setting of pokemons from pokemon api
class GetPokemonsAction extends LoadingAction {
  static const key = pokemonActionKey;

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons =
        await ApiService().pokemonApi.getPokemonList(offset: pokemonActionOffset, limit: pokemonActionLimit);

    return state.copyWith(pokemons: pokemons);
  }
}

class GetPokemonDetailsAction extends ReduxAction<AppState> {
  GetPokemonDetailsAction({required this.pokemonName});
  final String pokemonName;
  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(pokemonName: pokemonNameInput);
    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}
