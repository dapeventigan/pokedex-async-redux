import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/state/action/action.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class GetPokemonsAction extends LoadingAction {
  static const key = 'get-pokemon-action';

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons =
        await ApiService().pokemonApi.getPokemonList(offset: pokemonActionOffset, limit: pokemonActionLimit);

    return state.copyWith(pokemons: pokemons);
  }
}

class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get-pokemon-details';

  GetPokemonDetailsAction({required this.pokemons}) : super(actionKey: key);

  final Pokemon pokemons;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(pokemonName: pokemons.name.toString());
    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}

// This will clear pokemon details value when exiting the View Pokemon Details page.
class ClearPokemonDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(pokemonDetails: null);
}

//This action will search for pokemons by name
class SearchPokemonsAction extends ReduxAction<AppState> {
  SearchPokemonsAction({required this.searchText});

  final String searchText;

  @override
  AppState reduce() {
    final allPokemons = state.pokemons;
    List<Pokemon> searchedPokemons =
        allPokemons.filter((pokemon) => pokemon.name.contains(searchText.toLowerCase())).toList();
    return state.copyWith(searchedPokemons: searchedPokemons);
  }
}

/// This will clear the searched value from the store
class ClearSearchedPokemonsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(searchedPokemons: List.empty());
}
